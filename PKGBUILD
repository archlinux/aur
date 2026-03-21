#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tuned by hand

pkgname='python-jupyterlite-sphinx'
_module='jupyterlite-sphinx'
pkgver='0.22.1'
_src_folder="jupyterlite_sphinx-${pkgver}"
pkgrel=1
pkgdesc="Sphinx extension for deploying JupyterLite"
url="None"
depends=('python' 'python-docutils' 'jupyter-server' 'jupyter-nbformat' 'python-jupyterlab-server' 'python-jupyterlite-core' 'python-jupytext' 'python-sphinx' 'python-pydata-sphinx-theme' 'python-myst-parser' 'python-hatch')
#Requires-Dist: jupyterlite-xeus<4,>=0.1.8; extra == 'docs'
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://github.com/jupyterlite/jupyterlite-sphinx/releases/download/v${pkgver}/jupyterlite_sphinx-${pkgver}.tar.gz")
sha256sums=('e13682884deaecdb88dc81917df8a7275291f17575c3d1707b791e4a876a8556')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
