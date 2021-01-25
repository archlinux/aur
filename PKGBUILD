# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15
pkgver=1.2.8
pkgrel=2
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15"
license=('GPL')
depends=('libusb-compat')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha512sums=('ee2bb2209230c7e24c65864099c61c167109b953281045846133fa08b2d17e90bc2d78f5d4084291cab60363019e575a81137d3e65f9680d9b92946f93fc0fe3')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
