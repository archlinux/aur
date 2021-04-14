# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15
pkgver=3.0.4
pkgrel=1
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15"
license=('GPL')
depends=('libusb-compat')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('63e1dd49cdcb06a291976cbed54ae9052752feb6f3a3185aafbb6fa9cec6823d83b44494118b30282f390267da3ffa5b46ea5dcdc9d4f087e43969fd0bdaf84d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
