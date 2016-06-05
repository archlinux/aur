# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver='1.5.0'
pkgrel='1'
pkgdesc='This is an add-on for Mozilla Thunderbird that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url="https://github.com/lieser/${_dkim}"
license=('AGPL')
depends=('thunderbird')
source=("${_dkim}.xpi::${url}/releases/download/v${pkgver}/${_dkim}-${pkgver}.xpi")
sha256sums=('95986e0f7ee1e9bf04ec4193d1a1ff60bc44b423bb87fd2a51e122607a421660')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${_dkim}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_dkim}@pl.xpi"
  popd
}
