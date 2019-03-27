# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Stefano Zamprogno <stefano.zamprogno@gmail.com>

pkgname=bluez-firmware
pkgver=1.2
pkgrel=9
pkgdesc="Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips"
url="http://www.bluez.org/"
arch=('any')
license=('GPL2')
source=("http://bluez.sf.net/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('15db2f9d38a496882e4cc3754af1e58aa99e1b849f2066c541d76c66a8ffdc5532799fe1fd473cfc158bf5ea86a46687716cbcf83c6dcac0ce66d97d679648dd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  
  install -dm 755 ${pkgdir}/usr/share/doc/$pkgname
  mv ${pkgdir}/usr/lib/firmware/BCM-LEGAL.txt ${pkgdir}/usr/share/doc/$pkgname/
}
