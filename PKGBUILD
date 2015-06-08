pkgname=lowpan-tools
pkgver=0.3
pkgrel=1
pkgdesc="set of utils to manage Linux LoWPAN stack"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/linux-zigbee/"
license=('GPL')
depends=('libnl')
source=(http://downloads.sourceforge.net/linux-zigbee/$pkgname-$pkgver.tar.gz)
md5sums=('564bdf163de5b33232d751383495a65c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

