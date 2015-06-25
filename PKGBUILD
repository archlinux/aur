# Maintainer: Ayceman (Alexandru Ianu) <alexandru.ianu@gmail.com>
# Modified from canon-pixma-mx870-complete by Jeremy Sands <cto@jeremysands.com>

pkgname=canon-pixma-mx350-complete
pkgver=3.30
pkgrel=3
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX350"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100272202.html"
arch=('i686' 'x86_64')
license=('custom')
if [[ ${CARCH} = 'x86_64' ]]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4')
elif [[ ${CARCH} = 'i686' ]]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4')
fi
makedepends=('binutils')
source=('http://gdlp01.c-wss.com/gds/2/0100002722/01/cnijfilter-mx350series-3.30-1-i386-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/9/0100002729/01/scangearmp-mx350series-1.50-1-i386-deb.tar.gz')
md5sums=('eadb9028b51c94fa34954c90fd096c43'
	'5a04a1c0f0fad723584a40992ba2c3c8')

package(){
  cd ${srcdir}/cnijfilter-mx350series-3.30-1-i386-deb/packages/
  install cnijfilter-common_3.30-1_i386.deb ${pkgdir}
  install cnijfilter-mx350series_3.30-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx350series-1.50-1-i386-deb/packages
  install scangearmp-common_1.50-1_i386.deb ${pkgdir}
  install scangearmp-mx350series_1.50-1_i386.deb ${pkgdir}

  cd ${pkgdir}

  ar -x cnijfilter-common_3.30-1_i386.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter-common_3.30-1_i386.deb
  rm data.tar.gz

  ar -x cnijfilter-mx350series_3.30-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mx350series_3.30-1_i386.deb
  rm data.tar.gz

  ar -x scangearmp-common_1.50-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_1.50-1_i386.deb
  rm data.tar.gz

  ar -x scangearmp-mx350series_1.50-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mx350series_1.50-1_i386.deb
  rm data.tar.gz
}

