# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

_qt='quicktext'
pkgname="thunderbird-${_qt}"
pkgver='0.9.11.6'
pkgrel='2'
pkgdesc='Quicktext is an extension for Thunderbird that lets you create templates that can be easily inserted into your own emails'
arch=('any')
_url='http://extensions.hesslow.se/'
url="${_url}extension/4/${_qt}"
license=('AGPL')
depends=('thunderbird')
source=("${_qt}-${pkgver}.xpi::${_url}download/26/${_qt}_${pkgver}.xpi")
sha256sums=('31a5409d63a66299c4020b4e9eb5860a5f166fef9ab5a997d89b128f68ac82f1')
noextract=(${source[@]%%::*})

package() {
  pushd "$srcdir"
  install -Dm644 "${_qt}-${pkgver}.xpi" "$pkgdir/usr/lib/thunderbird/extensions/{8845e3b3-e8fb-40e2-95e9-ec40294818c4}.xpi"
  popd
}
