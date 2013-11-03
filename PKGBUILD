# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-m17n
pkgver=0.2.2
pkgrel=1
pkgdesc="Fcitx Wrapper for m17n."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.7' 'm17n-lib')
makedepends=('cmake')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")

build() {
    cd ${pkgname}-${pkgver}
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

sha512sums=('f0a708a351956c3972ae7d91050e274438c5631c785e829f746629f9cf2cb4c0bfe7dcb5f4e8bcda62e7761081526a484afb533a86b1c8b5c7d063f6ecbc502a')
