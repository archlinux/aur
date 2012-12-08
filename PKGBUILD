# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-hangul
pkgver=0.1.2
pkgrel=2
pkgdesc="Hangul (Korean) support for fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL2')
depends=('fcitx>=4.2.2' 'libhangul')
makedepends=('cmake' 'intltool')
install="$pkgname.install"
source=("http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz")
sha1sums=('30648e569ea75e2a734ed98f8cc90b0a656a6bf5')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    msg "Starting make..."

    rm -rf build
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
   cd "$srcdir/$pkgname-$pkgver/build"
   make DESTDIR="$pkgdir" install
}


