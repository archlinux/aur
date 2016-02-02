# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver='1.3.6'
pkgrel='1'
pkgdesc='This is an add-on for Mozilla Thunderbird that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url="https://github.com/lieser/${_dkim}"
license=('AGPL')
depends=('thunderbird')
source=("${_dkim}.xpi::$url/releases/download/v$pkgver/${_dkim}-$pkgver.xpi")
sha256sums=('6111b831a540ab4d8f915307f17247a4f1368f8f9cc94daff77026fe3ce2617e')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${_dkim}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_dkim}@pl.xpi"
  popd
}
