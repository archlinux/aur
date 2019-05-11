# Maintainer: land_or <gritzer.roland [at] gmail [dot] com>

pkgname="konica-minolta-c652-series"
pkgver="20000.0002"
pkgrel=1
pkgdesc="CUPS PostScript driver for KONICA MINOLTA bizhub C652DS Series (C452/C552/C652)"
url="https://www.konicaminolta.eu/en/business-solutions/support/download-center.html"
arch=("any")
license=('custom:konica minolta commercial license')
depends=("cups")
install="${pkgname}.install"
_distdir="BHC652PPDLinux_${pkgver//.}"
source=(
  "https://o.cses.konicaminolta.com/file/Default.aspx?FilePath=DL/201111/17065456/${_distdir}MU.zip"
  "LICENSE"
)
sha512sums=(
  '41753aee3490ac2f9f1598fef20742b33e7db1cdd9613a66a2877da6559f66e5c50768e98b7a8eadd030e16d03c9b49b3e05959c385b94e3284b5862480ae703'
  '95f5ceb1406e689c840411cef8f7803d9be6829c75a6eb8474ad3a1374ffca68db06cd56cf782578c02b2f7f3b190bb76f99f01e38a18254d7f0a6fbb48159f4'
)

package() {
  cd "$srcdir"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ppdmodel="${pkgdir}/usr/share/cups/model"
  
  # OpenOffice printer driver (same for all languages)
  install -D -m 644 "${_distdir}/English/CUPS1.2/KOC652opn.ppd" "${ppdmodel}/KOC652opn.ppd"

  # Language specific generic printer driver
  install -D -m 644 "${_distdir}/English/CUPS1.2/KOC652UX.ppd" "${ppdmodel}/KOC652UX.ppd"
  #install -D -m 644 "${_distdir}/French/CUPS1.2/KOC652FX.ppd" "${ppdmodel}/KOC652FX.ppd"
  #install -D -m 644 "${_distdir}/German/CUPS1.2/KOC652GX.ppd" "${ppdmodel}/KOC652GX.ppd"
  #install -D -m 644 "${_distdir}/Italian/CUPS1.2/KOC652IX.ppd" "${ppdmodel}/KOC652IX.ppd"
  #install -D -m 644 "${_distdir}/Spanish/CUPS1.2/KOC652SX.ppd" "${ppdmodel}/KOC652SX.ppd"
}
