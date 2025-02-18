# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver='5.6.0'
pkgrel='1'
pkgdesc='This is an add-on for Mozilla Thunderbird that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url="https://github.com/lieser/${_dkim}"
license=('AGPL')
depends=('thunderbird')
source=("${_dkim}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/dkim-verifier/addon-438634-latest.xpi?src=dp-btn-primary")
sha256sums=('5660b3cbc6f0271877d13ccac94ec5be96e187a80314178d00ba1ca77ffa3eb0')
noextract=(${source[@]%%::*})

package() {
  install -Dm0644 "${_dkim}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_dkim}@pl.xpi"
}
