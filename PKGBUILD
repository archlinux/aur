# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-code-fonts
pkgver=1.1.0
pkgrel=2
pkgdesc="A beautiful monospace Persian font based on Vazir and Inconsolata fonts."
url="https://github.com/rastikerdar/vazir-code-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir-code')
conflicts=('ttf-vazir-code')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-code-font-v${pkgver}.zip"
         "${pkgname}-WOL-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-code-font-without-latin-v${pkgver}.zip")
sha256sums=('cbe65897efc5e68244f678b39fe0c94c0c1390601faba45280a5c4fb2bf2b63c'
            '3b6ee046e3ee7185cda99ec009c5676e28c90cb7ebfaf09ebb8e09249d861f1f')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,Without-Latin/}Vazir-Code*.ttf
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
