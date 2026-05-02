# Maintainer: Qehbr <qehbr@yahoo.com>
pkgname=m913-ctl
pkgver=1.0.5
pkgrel=1
pkgdesc='Linux configuration tool for the Redragon M913 Impact Elite wireless mouse'
arch=('x86_64')
url='https://github.com/Qehbr/m913-ctl'
license=('GPL-3.0-only')
depends=('libusb')
makedepends=('cmake')
install=m913-ctl.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bff67b4422c3606f1737cba7673c6f9abe3d5c3816cb42a61c01bf851b885942')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
