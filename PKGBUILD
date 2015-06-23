# Maintainer: Ben Booth <benwbooth@gmail.com>
pkgname=trf
pkgver=4.07b
pkgrel=3
pkgdesc="Tandem repeats finder: a program to analyze DNA sequences"
arch=('i686' 'x86_64')
url="http://tandem.bu.edu/trf/trf.html"
license=('custom')
source=( 'trf407b.linux64::http://tandem.bu.edu/cgi-bin/trf/trf.download.pl?fileselect=26' 
         'trf407b.linux::http://tandem.bu.edu/cgi-bin/trf/trf.download.pl?fileselect=27'
         'LICENSE')
md5sums=('26d83513f43f1456542123c6fe8eecf2'
         '1b986c2e32d94be7f2357183f3154bce'
         '3fe7d501ed23c986e17c7acb7b9009d0')
package() {
  install -d ${pkgdir}/usr/share/licenses/trf
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/trf

  if test "$CARCH" == x86_64; then
    install -D -m755 ${srcdir}/trf407b.linux64 ${pkgdir}/usr/bin/trf
  elif test "$CARCH" == i686; then
    install -D -m755 ${srcdir}/trf407b.linux ${pkgdir}/usr/bin/trf
  fi
}
