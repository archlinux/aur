# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Ben Reedy <thebenj88 *AT* gmail *DOT* com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=clex
pkgver=4.6.patch6
pkgrel=1
pkgdesc="File manager with a full-screen user interface"
arch=('i686' 'x86_64')
url="http://www.clex.sk"
license=('GPL2')
depends=('ncurses')
source=($url/download/$pkgname-$pkgver.tar.gz)
md5sums=('c043711a65c62c600ae7babde7a8eef3')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
