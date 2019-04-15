# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=fllog
pkgver=1.2.6
pkgrel=1
pkgdesc="An Amateur Radio Logbook"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL')
depends=('fltk')
source=("https://downloads.sourceforge.net/project/fldigi/fllog/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d2c8b238c0cfb61faa1b3501645b91dafd6206958d2dbfcff59670ceaf42636beadc571a3066ecfd2799385faf5b1a033e023acfada95212392454c0683fbc5f')

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
