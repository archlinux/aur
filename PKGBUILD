# Maintainer: Florian Margaine <florian at margaine dot com>
pkgname=hermes
pkgver=1.8
pkgrel=1
pkgdesc="Authenticate on linux by plugging your USB stick!"
arch=(x86_64)
url="https://github.com/ralt/hermes"
license=('MIT')
depends=(pam libfixposix)
makedepends=(sbcl wget buildapp libfixposix pam)
options=(!strip)
install=
source=("https://github.com/ralt/$pkgname/archive/$pkgver.tar.gz")
md5sums=('9d3029dfb700ea51ab1f304971835f78')

build() {
        cd "$pkgname-$pkgver"
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}
