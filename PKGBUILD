# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-hangul
pkgver=0.3.0
pkgrel=1
pkgdesc="Hangul (Korean) support for fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL2')
depends=('fcitx>=4.2.7' 'libhangul')
makedepends=('cmake' 'intltool')
install=$pkgname.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

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

sha512sums=('07085508da98c49bcecf75fbfad6681263a735a1efcc4fb7a6fa05cb215dfe0c338e95e26cc55e488501b5abbc1007464b1bbf488f07aaca2d1a0a18c8173074')
