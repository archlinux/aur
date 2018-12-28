# Maintainer: Szymon Scholz
pkgname=lowpan-tools
pkgver=0.3.1
pkgrel=1
pkgdesc="set of utils to manage Linux LoWPAN stack"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/linux-zigbee/"
license=('GPL')
depends=('libnl')
source=(http://downloads.sourceforge.net/linux-zigbee/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make \
	CXXFLAGS="-D_FORTIFY_SOURCE=2" \
	CFLAGS="-fpermissive"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('a57b6a8ed18b80f57c5d3974391f2bc4')
