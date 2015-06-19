# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=librfm5
pkgver=5.3.16.0
pkgrel=1
pkgdesc="Rodent file manager library"
arch=('i686' 'x86_64')
url="http://xffm.org/"
license=('GPL3')
makedepends=('intltool')
depends=('libtubo0' 'libdbh2' 'libzip' 'gtk3' 'librsvg' 'file')
source=(http://downloads.sourceforge.net/project/xffm/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('6fb8e597d54c5cc23cbd3aaec5d309b6')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
