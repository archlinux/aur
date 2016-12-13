pkgname=canon-pixma-mx470-complete
pkgver=4.10
pkgrel=1
pkgdesc="Complete stand-alone driver set (printing and scanning) for Canon Pixma MX47X series"
url="https://www.canondrivers.co.uk/canon-pixma-mx475-driver-printer/"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = "x86_64" ]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
elif [ "${CARCH}" = "i686" ]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
fi
makedepends=('deb2targz')
source=('http://gdlp01.c-wss.com/gds/9/0100005869/01/cnijfilter-mx470series-4.10-1-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/1/0100005871/01/scangearmp-mx470series-2.30-1-deb.tar.gz')
md5sums=('fb955b2f93b5c1c63f373c07f91af17c'
         '7a04cd678e05812ee536d49ec1f32ac1')

package(){
  cd ${srcdir}/cnijfilter-mx470series-4.10-1-deb/packages/
  install cnijfilter-common_4.10-1_i386.deb ${pkgdir}
  install cnijfilter-mx470series_4.10-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx470series-2.30-1-deb/packages
  install scangearmp-common_2.30-1_i386.deb ${pkgdir}
  install scangearmp-mx470series_2.30-1_i386.deb ${pkgdir}

  cd ${pkgdir}

  deb2targz cnijfilter-common_4.10-1_i386.deb
  tar -xvf cnijfilter-common_4.10-1_i386.tar.gz
  rm cnijfilter-common_4.10-1_i386.deb
  rm cnijfilter-common_4.10-1_i386.tar.gz

  deb2targz cnijfilter-mx470series_4.10-1_i386.deb
  tar -xvf cnijfilter-mx470series_4.10-1_i386.tar.gz
  rm cnijfilter-mx470series_4.10-1_i386.deb
  rm cnijfilter-mx470series_4.10-1_i386.tar.gz

  deb2targz scangearmp-common_2.30-1_i386.deb
  tar -xvf scangearmp-common_2.30-1_i386.tar.gz
  rm scangearmp-common_2.30-1_i386.deb
  rm scangearmp-common_2.30-1_i386.tar.gz

  deb2targz scangearmp-mx470series_2.30-1_i386.deb
  tar -xvf scangearmp-mx470series_2.30-1_i386.tar.gz
  rm scangearmp-mx470series_2.30-1_i386.deb
  rm scangearmp-mx470series_2.30-1_i386.tar.gz
}
