# Maintainer: Arthur Țițeică arthur.titeica/gmail/com
# Contributor:Lucas Castro <lucascastroborges@gmail.com>

pkgname=squidview
pkgver=0.86
pkgrel=1
pkgdesc="Is an interactive console program which monitors and displays squid logs in a nice fashion. "
arch=('i686' 'x86_64')
url="http://www.rillion.net/squidview/"
# depends=('ncurses')
optdepends=('squid')
license=('GPL')
source=("http://www.rillion.net/squidview/$pkgname-$pkgver.tar.gz")
sha256sums=('bc63dcb2266a6a2a6256b77712d22d5df8d307807e074b128562feb8a2d1704e')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  
}
