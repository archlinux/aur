pkgname=intercal
pkgver=0.30
pkgrel=1
pkgdesc="INTERCAL de-obfuscator"
arch=('i686' 'x86_64')
url="http://catb.org/esr/intercal/"
license=('GPL2')
options=('staticlibs')
depends=('gcc')  # INTERCAL is special.
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('b38b62a61a3cb5b0d3ce9f2d09c97bd74796979d532615073025a7fff6be1715')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
