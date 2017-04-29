# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_qt='quicktext'
pkgname="thunderbird-${_qt}"
pkgver='0.9.11.7'
pkgrel='1'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
url="http://extensions.hesslow.se/extension/4/"
license=('AGPL')
depends=('thunderbird')
source=("${_qt}-${pkgver}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/${_qt}/addon-640-latest.xpi?src=ss")
sha256sums=('13fad549cc51913c1f37794c286f4a42958ed28cf08d82a5897684571d5bf387')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  install -Dm0644 "${_qt}-${pkgver}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/{8845E3B3-E8FB-40E2-95E9-EC40294818C4}.xpi"
}
