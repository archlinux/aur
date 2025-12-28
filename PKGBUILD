#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tuned by hand

pkgname='python-jupyterlite-sphinx'
_module='jupyterlite-sphinx'
_src_folder='jupyterlite_sphinx-0.22.0'
pkgver='0.22.0'
pkgrel=2
pkgdesc="Sphinx extension for deploying JupyterLite"
url="None"
depends=('python' 'python-docutils' 'jupyter-server' 'jupyter-nbformat' 'python-jupyterlab-server' 'python-jupyterlite-core' 'python-jupytext' 'python-sphinx' 'python-pydata-sphinx-theme' 'python-myst-parser' 'python-hatch')
#Requires-Dist: jupyterlite-xeus<4,>=0.1.8; extra == 'docs'
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/24/c3/d4f3a0d8abac7fa3e4b83d7b6b1451719d36b8567e02be228ed4476e37bf/jupyterlite_sphinx-0.22.0.tar.gz")
sha256sums=('586cefe8d1f5c9634dd23d96ea89237d014abfa3ed6cb556b8c133baa6b5f779')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
