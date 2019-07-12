# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="aenker"
url="https://github.com/ansemjo/$pkgname"
pkgdesc="Authenticated encryption on the commandline using a chunked construction and elliptic curve25519 keys."
license=('MIT')

pkgver=0.6.0
pkgrel=2
arch=('any')

depends=()
makedepends=('go')

provides=($pkgname)
conflicts=($pkgname)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8fa21f43ffdc0c88ea08e951a635dd9a855089682387fae56592b379d1a6a3b3')

build() {
  cd "$pkgname-$pkgver"
  make "$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
