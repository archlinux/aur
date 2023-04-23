# Maintainer: Frank Endres <frankendres@tuxfamily.org> - disabled, use first@last.fr

pkgname=thunderbird-grammalecte
pkgver=2.1.1
pkgrel=1
pkgdesc="Thunderbird Grammalecte plugin (orthographe et grammaire en langue française)"
arch=('any')
url="https://grammalecte.net/"
license=('GPL 3')
groups=('office')
depends=('thunderbird>=68')
source=("${pkgname}-${pkgver}.xpi::https://addons.thunderbird.net/user-media/addons/_attachments/809689/grammalecte_fr_for_thunderbird-${pkgver}-tb.xpi")
noextract=("${_name}-${pkgver}.xpi")
sha256sums=('0a1420ac53e3260d72e2bb05550cb6efacc37daadc9c9cae766e0c1f48f61c31')

package() {
  _extension_id="French-GC-TB@grammalecte.net"
  _extension_dest="${pkgdir}/usr/lib/thunderbird/extensions/${_extension_id}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.xpi" "${_extension_dest}.xpi"
}
