# Maintainer: Iru Cai <https://vimacs.wehack.space>
# Contributor: Pierpaolo Valerio <gondsman@techgeek.co.in>
pkgname=dpic
pkgver=2020.06.01
pkgrel=1
pkgdesc="A pic language interpreter"
arch=('x86_64' 'i686')
url="http://www.ece.uwaterloo.ca/~aplevich/dpic/"
license=('BSD')
makedepends=()
source=("https://ece.uwaterloo.ca/~aplevich/dpic/dpic-$pkgver.tar.gz")
sha256sums=('08616178b3d4116b5f9356a3640825d8fa76c84ab52ae45c775129c9e5ba73bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir/usr install
} 
