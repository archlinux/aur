# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>

# based on community/gpsim PKGBUILD by:
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=gpsim-cli
_basename=${pkgname%-cli}
pkgver=0.31.0
pkgrel=1
pkgdesc='Full-featured software simulator for Microchip PIC microcontrollers'
url='http://gpsim.sourceforge.net/'
arch=('x86_64')
license=('GPL')
depends=('popt')
makedepends=('gputils')
source=(https://downloads.sourceforge.net/${_basename}/${_basename}-${pkgver}.tar.gz)
sha256sums=('110ee6be3a5d02b32803a91e480cbfc9d423ef72e0830703fc0bc97b9569923f')
sha512sums=('a6af7e9170cee11c35f0e4731d39876e563edd8ca9cbd0f4b3017f224e5317b4c8bcc8aa4468102fa5c11157f487b6c7354e3aba8778842ed0b5be9bbb9ef45f')
conflicts=('gpsim')

build() {
  cd ${_basename}-${pkgver}
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd ${_basename}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
