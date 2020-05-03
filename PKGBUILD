# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_qt='quicktext'
pkgname="thunderbird-${_qt}"
pkgver='2.15'
pkgrel='1'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
url="http://extensions.hesslow.se/extension/4/"
license=('AGPL')
depends=('thunderbird')
source=("${_qt}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/${_qt}/addon-640-latest.xpi?src=ss")
sha256sums=('b5d5446f4a1ffe9a42fd628e7ba9f517aa735029c1b4073c27ff58a5358901c9')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  install -Dm0644 "${_qt}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/{8845E3B3-E8FB-40E2-95E9-EC40294818C4}.xpi"
}
