# Maintainer: chongli <kurto@mac.com>
pkgname=otf-montserrat
pkgver=0.1
pkgrel=3
pkgdesc="Often compared to Proxima Nova for it's charming utility, Montserrat is a useful typeface, loved by many web and UI designers. Designed by Julieta Ulanovsky."
arch=('any')
url="https://www.fontsquirrel.com/fonts/montserrat"
license=('custom:SIL')
provides=('otf-montserrat')
source=('https://www.fontsquirrel.com/fonts/download/montserrat'
        'sums')
sha256sums=('SKIP')

prepare () {

  sha256sum -c "${startdir}/sums"
}

package() {

  install -D -m644 "SIL Open Font License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 Montserrat-*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 MontserratAlternates-*.otf "${pkgdir}/usr/share/fonts/OTF/"
}

