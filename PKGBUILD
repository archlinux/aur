# Maintainer: Arthur Țițeică arthur.titeica/gmail/com
# Contributor:Lucas Castro <lucascastroborges@gmail.com>

pkgname=squidview
pkgver=0.81
pkgrel=1
pkgdesc="Is an interactive console program which monitors and displays squid logs in a nice fashion. "
arch=('i686' 'x86_64')
url="http://www.rillion.net/squidview/"
# depends=('ncurses')
optdepends=('squid')
license=('GPL')
source=("http://www.rillion.net/squidview/$pkgname-$pkgver.tar.gz")
sha256sums=('8c23585ef6bf02724cb51685e255fca260d42237a4ee344a64936e508f7cb148')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  
}
