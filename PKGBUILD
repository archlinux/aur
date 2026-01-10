# Maintainer: Frank Endres <frankendres@tuxfamily.org> - disabled, use first@last.fr

pkgname=firefox-grammalecte
pkgver=2.3.0
pkgrel=1
pkgdesc="Firefox Grammalecte plugin (orthographe et grammaire en langue française)"
arch=('any')
url="https://grammalecte.net/"
license=('GPL-3.0-only')
groups=('office')
depends=('firefox>=67')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/4643560/grammalecte_fr-${pkgver}.xpi")
sha256sums=('443030004dbf62ecd5fc42f7b96872b96c9e3765f1cba4704a2a4170bb945256')

package() {
  _extension_id="French-GC@grammalecte.net"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
