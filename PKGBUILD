# Maintainer: Frank Endres <frankendres@tuxfamily.org> - disabled, use first@last.fr

pkgname=firefox-grammalecte
pkgver=2.1.1
pkgrel=1
pkgdesc="Firefox Grammalecte plugin (orthographe et grammaire en langue française)"
arch=('any')
url="https://grammalecte.net/"
license=('GPL 3')
groups=('office')
depends=('firefox>=57')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3730860/grammalecte_fr-${pkgver}.xpi")
noextract=("${_name}-${pkgver}.xpi")
sha256sums=('4787e5f58b2c4d7f50f897339be020b2a78821f998ebaf397d42ba4ddbab4abd')

package() {
  _extension_id="French-GC@grammalecte.net"
  _extension_dest="${pkgdir}/usr/lib/firefox/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
