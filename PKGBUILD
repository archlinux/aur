# Maintainer: t-onoz <t [dot] onozuka [dot] 1990 [at] (g-mail)>
pkgname=ttf-ipa-mona
pkgver=1.0.8
_opfc_pkgver=1.1.1
pkgrel=2
pkgdesc="Extended Japanese Mona Font"
arch=('any')
license=('custom:Jun Kobayashi')
url="https://web.archive.org/web/20120403102610/https://www.geocities.jp/ipa_mona/"
# The font is only available as a bundle with this driver.
source=("https://web.archive.org/web/20111108024313if_/http://www.geocities.jp/ipa_mona/opfc-ModuleHP-${_opfc_pkgver}_withIPAMonaFonts-${pkgver}.tar.gz")
md5sums=('f9ef7fdbea1e30e778379fd945aec6ef')

package() {
  cd "${srcdir}/opfc-ModuleHP-${_opfc_pkgver}_withIPAMonaFonts-${pkgver}/fonts"
  for i in *.ttf; do install -Dm644 "${i}" "${pkgdir}/usr/share/fonts/TTF/${i}"; done
  install -Dm644 COPYING.font.ja "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.ja"
}
