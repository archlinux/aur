# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="localdimfinder-docs"
pkgver=1.0
pkgrel=1
pkgdesc="Documentation for localDimFinder"
arch=('any')
url="https://bertini.nd.edu/localDimFinder/index.html"
_url="https://bertini.nd.edu/localDimFinder"
license=('custom:Bertini license')
source=("MANUAL-${pkgver}.pdf::${_url}/LocalDimFinder.pdf"
        "ARTICLE-${pkgver}.pdf::${_url}/Mechanism_Mobility.pdf"
        "EXAMPLES-${pkgver}.zip::${_url}/MechanismMobilityExamples.zip")
sha256sums=('5efd5033e3f9eb3eb1523f09cf3ca72385e8fc0f1e1db921be2ee410a82cb81e'
            '77fa806e1ef6c39c724bcf3746110a28cbc390c1c8014767885f634cbc2f518b'
            'd82865bf2f9eff6186862aed21e88dfa1b343e8529715c1e9da3609f45c1fb0c')

package() {
  cd "${srcdir}"
  install -Dm644 "MANUAL-${pkgver}.pdf"  "${pkgdir}/usr/share/doc/localDimFinder/MANUAL.pdf"
  install -Dm644 "ARTICLE-${pkgver}.pdf" "${pkgdir}/usr/share/doc/localDimFinder/ARTICLE.pdf"
  
  cd "MechanismMobilityExamples"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/localDimFinder/examples/{}" \;
}
