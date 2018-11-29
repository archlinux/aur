# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="aenker"
pkgdesc="Authenticated encryption on the commandline using a chunked construction and elliptic curve keys."

pkgver=0.5.2
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('MIT')

depends=()
makedepends=('go')

provides=($pkgname)
conflicts=($pkgname)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('55ae760af8f2cc4cc3e780e7db692e6957ff341f0076919cf4dae3170664512c')

build() {
  cd "$pkgname-$pkgver"
  make "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# -------------------------------

