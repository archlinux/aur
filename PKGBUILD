# Maintainer: Your Name <melqtx@proton.me>
pkgname=qare
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple and fast command-line QR code generator"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/melqtx/qare"
license=('MIT')
depends=('qrencode')
makedepends=('cmake' 'gcc')
optdepends=('imagemagick: for PNG output support'
            'netpbm: alternative PNG output support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/melqtx/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ae77c6afb756918a7a339a8d3eabeb280b7f7e702703437bdb760dd4e368dab2')

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
} 