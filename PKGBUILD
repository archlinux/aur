# Contributors:
# henning mueller <henning@orgizm.net>
# krompus <amartin@riseup.net>
# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=anarchism
pkgver=15.1
pkgrel=1
_debpkgrel=4
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

sha256sums=('89c6f8f06bf6b81f8ec1862bbf54c16af661bbde72c4ec0597256a3532d631dc')
