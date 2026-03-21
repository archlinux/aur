#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-jupyterlite-core'
pkgver='0.7.4'
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
sha256sums=('c8a74b4ca9792f611b657465f63a79543b381063ebebdc2b5b3b695704e14278')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
