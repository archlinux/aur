# $Id: PKGBUILD 326125 2018-06-07 06:14:20Z felixonmars $
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=zd1211-firmware
pkgver=1.5
pkgrel=2
pkgdesc="Firmware for the in-kernel26 zd1211rw wireless driver"
arch=('any')
url="http://zd1211.wiki.sourceforge.net/"
license=('GPL')
provides=('zd1211')
source=("http://downloads.sourceforge.net/zd1211/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('6a8d39318a8c136b2a780ebeb485a94bbb05fa12ad7104b707314e0108e49939b4dcd0035b19f07dac0ec7bdd12668ea281b48724e512b45ac5df9dedf035897')

package() {
  cd "${srcdir}/${pkgname}"
  # Install firmware
  for i in zd1211*
  do
    install -D -m 644 $i "${pkgdir}/usr/lib/firmware/zd1211/$i"
  done
}
