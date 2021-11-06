# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_qt='quicktext'
pkgname="thunderbird-${_qt}"
pkgver='4.1'
pkgrel='1'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
url="http://extensions.hesslow.se/extension/4/"
license=('AGPL')
depends=('thunderbird')
source=("${_qt}.xpi::https://addons.mozilla.org/thunderbird/downloads/latest/${_qt}/addon-640-latest.xpi?src=ss")
sha256sums=('391feeb6c53da0a17e478b9395cff5f5e5e02f57b4d33712676a99cc4a7826ae')
noextract=(${source[@]%%::*})

package() {
  cd "${srcdir}"
  install -Dm0644 "${_qt}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/{8845E3B3-E8FB-40E2-95E9-EC40294818C4}.xpi"
}
