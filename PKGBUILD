# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-m17n
pkgver=0.2.1
pkgrel=1
pkgdesc="Fcitx Wrapper for m17n."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.7' 'm17n-lib')
makedepends=('cmake')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

sha512sums=('b2becf6f20de32191690a5541956dc0a607443bd593fbfb61d1663dcc1f854df6b146c17ed73afbdff4006c12f001707de87adc706b3e1d45608bbf2bc045bce')
