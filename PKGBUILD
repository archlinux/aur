# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver='5.3.1'
pkgrel='1'
pkgdesc='This is an add-on for Mozilla Thunderbird that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url="https://github.com/lieser/${_dkim}"
license=('AGPL')
depends=('thunderbird')
source=("${_dkim}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/dkim-verifier/addon-438634-latest.xpi?src=dp-btn-primary")
sha256sums=('501d12682d6abefe120d716af3259a81a5c78aa47abaeb2199739c2af7d6c6b0')
noextract=(${source[@]%%::*})

package() {
  install -Dm0644 "${_dkim}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_dkim}@pl.xpi"
}
