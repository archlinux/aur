# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-hangul
pkgver=0.2.1
pkgrel=1
pkgdesc="Hangul (Korean) support for fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL2')
depends=('fcitx>=4.2.7' 'libhangul')
makedepends=('cmake' 'intltool')
install=$pkgname.install
source=("http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz")

build() {
    cd "$srcdir/$pkgname-$pkgver"

    msg "Starting make..."

    mkdir -p build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
   cd "$srcdir/$pkgname-$pkgver/build"
   make DESTDIR="$pkgdir" install
}

md5sums=('d3dac52b1a1697a4f8256e383c889216')
