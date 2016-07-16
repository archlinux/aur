# Contributor: Simon Copar <info.ised@gmail.com>
pkgname=ised
pkgver=2.7.1
pkgrel=1
pkgdesc="command line calculator and numeric sequence editor"
arch=('i686' 'x86_64')
url="http://ised.sourceforge.net"
license=('GPL3')
depends=('readline')
makedepends=('readline')
source=(http://downloads.sourceforge.net/project/ised/$pkgname-$pkgver.tar.bz2)
md5sums=('fa15606435222f670caafee0d41d2b0b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
