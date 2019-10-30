# Maintainer: shieldwed <shieldwed [at] outlook [dot] com>

pkgname="konica-minolta-bizhub-c554e-series"
pkgver="30000.0001"
pkgrel=1
pkgdesc="CUPS PostScript driver for KONICA MINOLTA bizhub C554e Series (C554e/C454e/C364e/C284e/C224e)"
url="https://www.konicaminolta.eu/en/business-solutions/support/download-center.html"
arch=("any")
license=('custom:konica minolta commercial license')
depends=("cups")
install="${pkgname}.install"
_distdir="BHC554ePPDLinux_${pkgver//.}"
source=(
  "https://www.uibk.ac.at/downloads/th-physik/Driver/bizhubC364e/Linux/${_distdir}MU.zip"
  "LICENSE"
)
sha512sums=(
  '93658a16338faf7efa3720c3c23a2f2e3f6a46f6e7342c08c09f0db26671746af40cb229cd53f22a5ca731753c9588a08e9ff3f8a007f6b6f0023627c4938957'
  '95f5ceb1406e689c840411cef8f7803d9be6829c75a6eb8474ad3a1374ffca68db06cd56cf782578c02b2f7f3b190bb76f99f01e38a18254d7f0a6fbb48159f4'
)

package() {
  cd "$srcdir"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ppdmodel="${pkgdir}/usr/share/cups/model"
  
  # OpenOffice printer driver (same for all languages)
  install -D -m 644 "${_distdir}/English/CUPS1.2/KOC554opn.ppd" "${ppdmodel}/KOC554opn.ppd"

  # Language specific generic printer driver
  install -D -m 644 "${_distdir}/English/CUPS1.2/KOC554UX.ppd" "${ppdmodel}/KOC554UX.ppd"
  #install -D -m 644 "${_distdir}/French/CUPS1.2/KOC554FX.ppd" "${ppdmodel}/KOC554FX.ppd"
  #install -D -m 644 "${_distdir}/German/CUPS1.2/KOC554GX.ppd" "${ppdmodel}/KOC554GX.ppd"
  #install -D -m 644 "${_distdir}/Italian/CUPS1.2/KOC554IX.ppd" "${ppdmodel}/KOC554IX.ppd"
  #install -D -m 644 "${_distdir}/Spanish/CUPS1.2/KOC554SX.ppd" "${ppdmodel}/KOC554SX.ppd"
}
