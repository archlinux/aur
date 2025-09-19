# Maintainer: envolution
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# shellcheck shell=bash disable=SC2034,SC2154

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver=6.2.0
pkgrel=1
pkgdesc='Thunderbird add-on that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url="https://github.com/lieser/${_dkim}"
license=('MIT')
depends=('thunderbird')
source=(
  "${_dkim}.xpi::https://github.com/lieser/dkim_verifier/releases/download/v${pkgver}/dkim_verifier-${pkgver}.xpi"
  "LICENSE::https://raw.githubusercontent.com/lieser/dkim_verifier/refs/tags/v${pkgver}/LICENSE.txt"
  "THIRDPARTY_LICENSE::https://raw.githubusercontent.com/lieser/dkim_verifier/refs/tags/v${pkgver}/THIRDPARTY_LICENSE.txt"
)
sha256sums=('d60bcfdcc22fe82e8f1f63e4066aab8561fa509526b87dc3ca4b90f601985c53'
            '03d6bb2abd2f2982aca61000c34cf4c68a63e12bd10ed2edad107e2b8f4263e0'
            '1d8fe759434c5e51dc3145ead39d6c49f2740106e0c30655197cd415490c3ec3')
noextract=(${source[@]%%::*})

package() {
  install -Dm0644 "${_dkim}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_dkim}@pl.xpi"
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 THIRDPARTY_LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
