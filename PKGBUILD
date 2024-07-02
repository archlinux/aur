# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=python-pillow_heif
pkgver=0.17.0
pkgrel=1
pkgdesc="Python bindings to libheif for working with HEIF images and plugin for Pillow."
arch=('any')
url="https://github.com/bigcat88/pillow_heif"
license=('BSD-3')
depends=('python' 'libheif' 'x265' 'aom' 'libde265')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-setuptools')
source=(https://github.com/bigcat88/pillow_heif/archive/refs/tags/v0.17.0.tar.gz)
sha256sums=('6f4780fbe6d63e22f148cb5011b7640f445617762cdae303b683bd0376a65a66')
options=(!buildflags)

build() {
    cd "$srcdir/pillow_heif-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pillow_heif-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
