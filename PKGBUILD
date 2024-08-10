# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=python-pillow_heif
pkgver=0.18.0
pkgrel=1
pkgdesc="Python bindings to libheif for working with HEIF images and plugin for Pillow."
arch=('any')
url="https://github.com/bigcat88/pillow_heif"
license=('BSD-3')
depends=('python' 'libheif' 'x265' 'aom' 'libde265')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-setuptools')
source=(https://github.com/bigcat88/pillow_heif/archive/refs/tags/v0.18.0.tar.gz)
sha256sums=('21b4925e678955b1003b37663e6c5032eec8580e6cec018a95775d21b74ae2d1')
options=(!buildflags)

build() {
    cd "$srcdir/pillow_heif-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pillow_heif-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
