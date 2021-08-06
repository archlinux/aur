# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=fllog
pkgver=1.2.7
pkgrel=1
pkgdesc="An Amateur Radio Logbook"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL')
depends=('fltk')
source=("https://downloads.sourceforge.net/project/fldigi/fllog/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a53b6a11a9516c18e3620c5a6ea6403f546496397c325940e86a1e456312473ce6dcd6fed7fd07f133f1240a19d3022675831205770f1972523bb7c587b0a8dc')

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
