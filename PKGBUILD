# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_qt='quicktext'
pkgname="thunderbird-${_qt}"
pkgver='5.18'
pkgrel='1'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
url="https://github.com/jobisoft/${_qt}"
license=('MPLV2')
depends=('thunderbird')
source=("${_qt}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/${_qt}/addon-640-latest.xpi?src=ss")
sha256sums=('7ab528c1d5e8a90f88b51ca3ccf9c967c192e4e672ba756cccdb3bf45b65f3ff')
noextract=(${source[@]%%::*})

package() {
  install -Dm0644 "${_qt}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/{8845E3B3-E8FB-40E2-95E9-EC40294818C4}.xpi"
}
