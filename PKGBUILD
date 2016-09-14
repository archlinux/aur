# Maintainer: Arthur Țițeică arthur.titeica/gmail/com
# Contributor:Lucas Castro <lucascastroborges@gmail.com>

pkgname=squidview
pkgver=0.83
pkgrel=1
pkgdesc="Is an interactive console program which monitors and displays squid logs in a nice fashion. "
arch=('i686' 'x86_64')
url="http://www.rillion.net/squidview/"
# depends=('ncurses')
optdepends=('squid')
license=('GPL')
source=("http://www.rillion.net/squidview/$pkgname-$pkgver.tar.gz")
sha256sums=('54c1440bf27a0eea0684d7180eb77ae234b0a521f0eec0d62185a0edfb3a7ec6')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  
}
