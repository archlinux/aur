# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Ben Reedy <thebenj88 *AT* gmail *DOT* com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=clex
pkgver=4.6.patch7
pkgrel=1
pkgdesc="File manager with a full-screen user interface"
arch=('i686' 'x86_64')
url="http://www.clex.sk"
license=('GPL2')
depends=('ncurses')
source=($url/download/$pkgname-$pkgver.tar.gz)
md5sums=('0bc701e674162b1191a5bdc52514425c')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
