# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=ef3usb
pkgver=1.94
_pkgver=194
pkgrel=1
pkgdesc='All-in-1 utility for the EasyFlash3 cartridge and its USB connection to the PC'
arch=('i686' 'x86_64')
url='https://csdb.dk/release/?id=198123'
depends=('libftdi-compat' 'tass64')
license=('unknown')
source=("http://csdb.dk/getinternalfile.php/206596/ef3usb${_pkgver}.zip")
sha256sums=('4aece312019dbbc53d10d8ec2ffeff762bbc83ace7e453d3fbc32b553943e133')

build() {
  cd $srcdir/${pkgname}${_pkgver}/Src
  make
}

package() {
  install -D ${srcdir}/${pkgname}${_pkgver}/Src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D ${srcdir}/${pkgname}${_pkgver}/Src/${pkgname}.prg ${pkgdir}/usr/share/${pkgname}/${pkgname}.prg
  install -D ${srcdir}/${pkgname}${_pkgver}/readme.txt ${pkgdir}/usr/share/${pkgname}/readme.txt
}

