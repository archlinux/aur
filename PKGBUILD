# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Guillermo Pérez García <gperezgar@tutanota.com>

pkgname=ttf-manrope
pkgver=5.3.0
pkgrel=1
pkgdesc="An open-source modern sans-serif font family with comprehensive language support"
arch=('any')
url="https://fontsource.org/fonts/manrope"
license=('OFL-1.1-RFN')
# The fontsource download API is the only live distribution channel (the
# author's GitHub repo is gone). Version-pinned zip is deterministic.
source=("${pkgname}-${pkgver}.zip::https://api.fontsource.org/v1/download/manrope?version=${pkgver}")
sha256sums=('42de7ffbbb8a49b39f329f4fe4f790fda571fc014deabb67a10aa785ea97c425')

package() {
  # Create font directory
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"

  # Install all TTF files (static instances; the zip also contains
  # variable and woff/woff2 variants under static/ and variable/)
  install -m 644 "${srcdir}/static/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"

  # Install license
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
