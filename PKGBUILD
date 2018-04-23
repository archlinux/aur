# Contributors:
# henning mueller <henning@orgizm.net>
# krompus <amartin@riseup.net>
# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=anarchism
pkgver=15.1
pkgrel=2
_debpkgrel=5
pkgdesc='Source of information regarding Anarchist (libertarian socialist) theory and practice.'
arch=(any)
license=(FDL)
url=http://www.infoshop.org/AnAnarchistFAQ
options=(docs)
depends=(xdg-utils)
makedepends=(librsvg)
source=(http://ftp.debian.org/debian/pool/main/a/$pkgname/$pkgname\_$pkgver-$_debpkgrel\_all.deb)

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cd $srcdir
  cp -r usr $pkgdir
  mkdir -p $pkgdir/usr/share/pixmaps
  rsvg-convert -a -h 256 usr/share/$pkgname/icons/$pkgname.svg > $pkgdir/usr/share/pixmaps/$pkgname.png
}

sha256sums=('526cf1bc84b6d9a97f6cf7f5d875d5e369194a079324ef6e5463ff378ee07e1b')
