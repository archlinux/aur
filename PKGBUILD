#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-jupyterlite-core'
pkgver='0.8.6'
_module='jupyterlite-core'
_src_folder="jupyterlite_core-${pkgver}"
pkgrel=1
pkgdesc="Wasm powered Jupyter running in the browser"
url="https://github.com/jupyterlite"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-tornado')
optdepends=('python-libarchive-c: for better performance when working with archives')
license=('custom:BSD License')
arch=('any')
source=("https://github.com/jupyterlite/jupyterlite/releases/download/v${pkgver}/jupyterlite_core-${pkgver}.tar.gz")
sha256sums=('d6abd7ff7efb069186db060fbf4a43033ce09373ec3c7273565e0e0819346eb2')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
