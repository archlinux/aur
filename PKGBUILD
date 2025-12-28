#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tuned by hand

pkgname='python-jupyterlite-sphinx'
_module='jupyterlite-sphinx'
_src_folder='jupyterlite_sphinx-0.22.0'
pkgver='0.22.0'
pkgrel=1
pkgdesc="Sphinx extension for deploying JupyterLite"
url="None"
depends=('python' 'docutils' 'jupyter-server' 'jupiterlab-server' 'python-juputerlite-core' 'jupytext' 'python-sphinx' 'python-nbformat')
Requires-Dist: jupytext
Provides-Extra: dev
Requires-Dist: hatch; extra == 'dev'
Provides-Extra: docs
Requires-Dist: jupyterlite-xeus<4,>=0.1.8; extra == 'docs'
Requires-Dist: myst-parser; extra == 'docs'
Requires-Dist: pydata-sphinx-theme; extra == 'docs'

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
