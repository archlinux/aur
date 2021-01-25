# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15
pkgver=1.2.8
pkgrel=1
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15"
license=('GPL')
depends=('libusb-compat')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha512sums=('7c648992605b827080ca8c7d9468a7f8d028ebed01d49cc88aebfa0c754dfc5f2e03fac8d1857183962d06a402be3d9d45de6925d7492bd1682151d2934e47ba')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
