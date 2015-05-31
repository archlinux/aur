# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=akia
pkgver=1.6
pkgrel=1
pkgdesc="View and modify files,folders and objects in an AKIS smartcard"
arch=('i686' 'x86_64')
url="http://www.akiskart.com.tr"
license=('custom')
depends=('pcsclite' 'ccid' 'java-environment')
source=(akia)
md5sums=('9a7bf17f1f36f0d936b23b72786e0282')

if test "$CARCH" == x86_64; then
    source+=(http://www.akiskart.com.tr/dosyalar/akis_1.6_amd64.deb)
    md5sums+=('782c6eb75e20857d0f8eb5520ad90654')
elif test "$CARCH" == x86_64; then
    source+=(http://www.akiskart.com.tr/dosyalar/akis_1.5_i386.deb)
    md5sums+=('f59fe9a741b22639d5c53e598e92cb02')
fi

package() {

  tar -zxf data.tar.gz -C "${srcdir}"
  
  rm -rf "${srcdir}"/usr/bin
  
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/usr/bin
  
  mv "${srcdir}"/usr/* "${pkgdir}"/usr
  install -Dm755 "${srcdir}"/akia "${pkgdir}"/usr/bin/akia
}
