# Maintainer: Ilja Kartaschoff <ik@lowenware.com>
pkgname=webstuff
pkgver=0.7.12
pkgrel=5
pkgdesc="Lightweight C Library for web-applications development"
arch=('any')
url="http://www.lowenware.com/"
license=('BSD')
source=(http://www.lowenware.com/download/webstuff/$pkgname-$pkgver.tar.gz)
md5sums=('8c370b971a0c9c096b2538099e6dfb5d')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --with-templight --with-opts-parser --with-conf-parser
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
