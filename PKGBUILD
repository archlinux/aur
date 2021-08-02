# Maintainer: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Contributor: Jose Luis Lafuente <jl@lafuente.me>

pkgname=canon-pixma-mx495-printer
pkgver=5.10
pkgrel=1
pkgdesc="Printer driver for Canon Pixma MX495"
url="http://www.canon.co.uk/support/consumer_products/products/fax__multifunctionals/inkjet/pixma_mx_series/pixma_mx495.aspx"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = "x86_64" ]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4')
  _arch='amd64'
elif [ "${CARCH}" = "i686" ]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
  _arch='i386'
fi
source=("http://gdlp01.c-wss.com/gds/9/0100006669/01/cnijfilter2-${pkgver}-${pkgrel}-deb.tar.gz")
md5sums=('7dd81b16288dc0b46221d600e9541695')

package(){
  cd ${srcdir}/cnijfilter2-${pkgver}-${pkgrel}-deb/packages/
  install cnijfilter2_${pkgver}-${pkgrel}_${_arch}.deb ${pkgdir}

  cd ${pkgdir}
  ar -x cnijfilter2_${pkgver}-${pkgrel}_${_arch}.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter2_${pkgver}-${pkgrel}_${_arch}.deb
  rm data.tar.gz
}
