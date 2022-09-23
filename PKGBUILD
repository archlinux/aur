# $Id$
# Maintainer : Jens Staal <staal1978@gmail.com>

pkgname=fcsalyzer
pkgver=0.9.22
_pkgversuffix=-alpha
pkgrel=1
pkgdesc="FCSalyzer is a free program for analysing flow cytometry data"
arch=('any')
url="https://sourceforge.net/projects/fcsalyzer/"
license=('GPLv3')
makedepends=('java-runtime') #we are static
source=("https://sourceforge.net/projects/fcsalyzer/files/Version%20${pkgver}${_pkgversuffix}/FCSalyzer%20${pkgver}${_pkgversuffix}.zip" "FCSalyzer")
sha512sums=('9f42990ddecd95bbb84605370a16e46e6bcae44738f3eaefa99a3ea28d56feffe4c80fe8d5da25df3faf49f9e5cf0b15aa428fba2380f870b660f09038e3e3e2'
            '543c0acfe6bc2b1b72896b615aa19b01279253a81becd011e061c336dec6cb245a7cdb762f281087b11550986caed6780aadf1eeb46daa535f2c7f2b61f16e85')


package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/usr/share/java/FCSalyzer
  cp FCSalyzer_alternative.jar ${pkgdir}/usr/share/java/FCSalyzer/
  mkdir -p ${pkgdir}/usr/bin
  cp FCSalyzer ${pkgdir}/usr/bin/
  chmod +x ${pkgdir}/usr/bin/FCSalyzer

  # license
  install -m644 -D License.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
 
