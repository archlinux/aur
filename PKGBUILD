# Maintainer: ValdikSS <iam@valdikss.org.ru>

pkgname=libusb0
pkgver=0.1.12
pkgrel=5
pkgdesc="Library to enable user space application programs to communicate with USB devices. 0.x branch. Debian's binary."
arch=('i686' 'x86_64')
url="http://libusb.sourceforge.net/"
license=('LGPL')
depends=('sh')
provides=('libusb-compat')
#replaces=('libusb-compat')
conflicts=('libusb-compat')
_debianver='0.1-4_0.1.12-25'
source=("http://ftp.debian.org/debian/pool/main/libu/libusb/libusb-${_debianver}_i386.deb")
md5sums=('582aee4738aecee1ad2d4c725510b419')

if test "$CARCH" == x86_64; then
  source=("http://ftp.debian.org/debian/pool/main/libu/libusb/libusb-${_debianver}_amd64.deb")
fi

package() {
  tar axvf ${srcdir}/data.tar.xz -C ${pkgdir}/
  mkdir -p ${pkgdir}/usr/lib
  mv ${pkgdir}/lib/x86_64-linux-gnu/* ${pkgdir}/usr/lib || true
  mv ${pkgdir}/lib/i386-linux-gnu/* ${pkgdir}/usr/lib || true
  rm -rf ${pkgdir}/lib/x86_64-linux-gnu/ ${pkgdir}/lib/i386-linux-gnu/
}
