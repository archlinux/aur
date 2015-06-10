# Maintainer: ValdikSS <iam@valdikss.org.ru>

pkgname=lib32-libusb0
pkgver=0.1.12
pkgrel=6
pkgdesc="Library to enable user space application programs to communicate with USB devices. 0.x branch. Debian's binary."
arch=('x86_64')
url="http://libusb.sourceforge.net/"
license=('LGPL')
depends=('sh')
provides=('lib32-libusb-compat')
#replaces=('lib32-libusb-compat')
conflicts=('lib32-libusb-compat')
_debianver='0.1-4_0.1.12-25'
source=("http://ftp.debian.org/debian/pool/main/libu/libusb/libusb-${_debianver}_i386.deb")
md5sums=('316254e4ae2ff97f520948ffbb4af1ad')

package() {
  tar axvf ${srcdir}/data.tar.xz -C ${pkgdir}/
  mkdir ${pkgdir}/usr/lib32
  mv ${pkgdir}/lib/i386-linux-gnu/* ${pkgdir}/usr/lib32
  rm -rf ${pkgdir}/lib/x86_64-linux-gnu/ ${pkgdir}/lib/ ${pkgdir}/usr/share/doc
}
