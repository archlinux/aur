# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

_qt='quicktext'
pkgname=thunderbird-${_qt}
pkgver='0.9.11.5'
pkgrel='2'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
_url='http://extensions.hesslow.se/'
url=${_url}extension/4/${_qt}
license=('AGPL')
depends=('thunderbird')
source=("${_qt}-${pkgver}.xpi::https://addons.mozilla.org/thunderbird/downloads/file/178928/${_qt}-${pkgver}-tb.xpi")
sha256sums=("dfaa07b14c7335e9c526c4c31cff51f6a30dfcd4f9d5d88a341db7bcdc96f641")
#noextract=("${_qt}-${pkgver}.xpi")
noextract=(${source[@]%%::*})

package() {
  pushd "$srcdir"
  install -Dm644 "${_qt}-${pkgver}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/${_qt}.xpi"
  popd
}
