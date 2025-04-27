# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Guillermo Pérez García <gperezgar@tutanota.com>

pkgname=ttf-manrope
pkgver=5.2.5
pkgrel=1
pkgdesc="An open-source modern sans-serif font family with comprehensive language support"
arch=('any')
url="https://fontsource.org/fonts/manrope"
license=('OFL-1.1')
source=("${pkgname}-${pkgver}.zip::https://r2.fontsource.org/fonts/manrope@${pkgver}/download.zip")
sha256sums=('6862c5e65c085e9f918f0b91e4698f9657703174efe05e6faf5b957eac244f2b')

package() {
  # Create font directory
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  
  # Install all TTF files
  install -m 644 "${srcdir}/ttf/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  
  # Install license
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
