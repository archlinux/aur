# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=fllog
pkgver=1.2.5
pkgrel=1
pkgdesc="An Amateur Radio Logbook"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL')
depends=('fltk')
source=("https://downloads.sourceforge.net/project/fldigi/fllog/${pkgname}-${pkgver}.tar.gz")
sha512sums=('22b01ee095444d4454deb6f07f399e92c40d65faaff1eeba24baad54a47064250c8f40927a2fae7f58808ae86067ca7be167ed91b72f79c1c4bf048d1923a7e4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
