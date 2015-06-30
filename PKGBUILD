# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=lastfmlib
pkgver=0.4.0
pkgrel=1
pkgdesc="A library that provides an implementation of the Last.fm protocol"
arch=('i686' 'x86_64')
url="http://code.google.com/p/lastfmlib/"
license=('GPL')
depends=('curl')
options=('!libtool')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('f6f00882c15b8cc703718d22e1b1871f')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install || return 1
}