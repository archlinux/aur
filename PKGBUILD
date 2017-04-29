# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver='1.6.4'
pkgrel='1'
pkgdesc='This is an add-on for Mozilla Thunderbird that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url="https://github.com/lieser/${_dkim}"
license=('AGPL')
depends=('thunderbird')
source=("${_dkim}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/dkim-verifier/addon-438634-latest.xpi?src=dp-btn-primary")
sha256sums=('a6e8d7786363bf632292bd65b78b9dac832bf26f2e3baf69f17b557edffd74e5')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  install -Dm0644 "${_dkim}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_dkim}@pl.xpi"
}
