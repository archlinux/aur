# Maintainer:  Jeremy Sands <cto@jeremysands.com>

pkgname=canon-pixma-mx450-complete
pkgver=3.90
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX450 series"
url=('http://www.canon.de/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/MX455.aspx')
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = "x86_64" ]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
elif [ "${CARCH}" = "i686" ]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
fi
makedepends=('deb2targz')
source=('http://gdlp01.c-wss.com/gds/3/0100005153/01/cnijfilter-mx450series-3.90-1-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/7/0100005177/01/scangearmp-mx450series-2.10-1-deb.tar.gz')
md5sums=('09707c1d807b8a4008ddf24d61f1af05'
	'48eec5bb9d80cf4790bf096f7d9c3fd1')

build(){
  cd ${srcdir}/cnijfilter-mx450series-3.90-1-deb/packages/
  install cnijfilter-common_3.90-1_i386.deb ${pkgdir}
  install cnijfilter-mx450series_3.90-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx450series-2.10-1-deb/packages
  install scangearmp-common_2.10-1_i386.deb ${pkgdir}
  install scangearmp-mx450series_2.10-1_i386.deb ${pkgdir}

  cd ${pkgdir}

  deb2targz cnijfilter-common_3.90-1_i386.deb
  tar -xvf cnijfilter-common_3.90-1_i386.tar.gz
  rm cnijfilter-common_3.90-1_i386.deb
  rm cnijfilter-common_3.90-1_i386.tar.gz

  deb2targz cnijfilter-mx450series_3.90-1_i386.deb
  tar -xvf cnijfilter-mx450series_3.90-1_i386.tar.gz
  rm cnijfilter-mx450series_3.90-1_i386.deb
  rm cnijfilter-mx450series_3.90-1_i386.tar.gz

  deb2targz scangearmp-common_2.10-1_i386.deb
  tar -xvf scangearmp-common_2.10-1_i386.tar.gz
  rm scangearmp-common_2.10-1_i386.deb
  rm scangearmp-common_2.10-1_i386.tar.gz

  deb2targz scangearmp-mx450series_2.10-1_i386.deb
  tar -xvf scangearmp-mx450series_2.10-1_i386.tar.gz
  rm scangearmp-mx450series_2.10-1_i386.deb
  rm scangearmp-mx450series_2.10-1_i386.tar.gz
}
