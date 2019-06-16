# Maintainer: Iru Cai <https://vimacs.wehack.space>
# Contributor: Pierpaolo Valerio <gondsman@techgeek.co.in>
pkgname=dpic
pkgver=2019.06.15
pkgrel=1
pkgdesc="A pic language interpreter"
arch=('x86_64' 'i686')
url="http://www.ece.uwaterloo.ca/~aplevich/dpic/"
license=('BSD')
makedepends=()
source=("https://ece.uwaterloo.ca/~aplevich/dpic/dpic-$pkgver.tar.gz")
sha256sums=('e7096408e547a40fdecdb92cab67db5499e737678c499f29fc23baa00b25d603')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir/usr install
} 
