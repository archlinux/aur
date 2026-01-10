# Maintainer: Frank Endres <frankendres@tuxfamily.org> - disabled, use first@last.fr

pkgname=thunderbird-grammalecte
pkgver=2.3.0
pkgrel=1
pkgdesc="Thunderbird Grammalecte plugin (orthographe et grammaire en langue française)"
arch=('any')
url="https://grammalecte.net/"
license=('GPL-3.0-only')
groups=('office')
depends=('thunderbird>=78')
source=("${pkgname}-${pkgver}.xpi::https://addons.thunderbird.net/thunderbird/downloads/file/1043463/grammalecte_fr_for_thunderbird-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}.xpi")
sha256sums=('0caa8b843482f39576962b7b3586d3b274e0cc64f5eb0e1e299c571aed68f560')

package() {
  _extension_id="French-GC-TB@grammalecte.net"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
