# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver='1.5.1'
pkgrel='1'
pkgdesc='This is an add-on for Mozilla Thunderbird that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url="https://github.com/lieser/${_dkim}"
license=('AGPL')
depends=('thunderbird')
source=("${_dkim}.xpi::${url}/releases/download/v${pkgver}/${_dkim}-${pkgver}.xpi")
sha256sums=('b80b7b731ce42e9b0ca53714d853b892311f2559cb79f8da62a6926fccb8ec3b')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${_dkim}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_dkim}@pl.xpi"
  popd
}
