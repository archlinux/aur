# Maintainer: Qehbr <qehbr@yahoo.com>
pkgname=m913-ctl
pkgver=1.0.6
pkgrel=1
pkgdesc='Linux configuration tool for the Redragon M913 Impact Elite wireless mouse'
arch=('x86_64')
url='https://github.com/Qehbr/m913-ctl'
license=('GPL-3.0-only')
depends=('libusb')
makedepends=('cmake')
install=m913-ctl.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cf1fa835143f9190aba24f537c995343ba07eb3bb4691173ca1d8d0f8ea9f4d5')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
