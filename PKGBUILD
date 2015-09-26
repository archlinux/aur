# Maintainer: Ilja Kartaschoff <ik@lowenware.com>
pkgname=webstuff
pkgver=0.7.8
pkgrel=2
pkgdesc="Lightweight C Library for web-applications development"
arch=('any')
url="http://www.lowenware.com/"
license=('BSD')
source=(http://www.lowenware.com/download/webstuff/$pkgname-$pkgver.tar.gz)
md5sums=('fb9e86eb94dd0b6c51eaa7a51e30b52a')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --with-templight --with-opts-parser --with-conf-parser
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
