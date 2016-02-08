# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname="firefox-vacuum-places"
pkgver='1.2.1'
pkgrel='1'
pkgdesc='Defragments your Firefox "Places" database (history/bookmarks). This greatly reduces the lag while typing in the address bar and the start-up time.'
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/vacuum-places-improved"
license=('MPL')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/13878/addon-13878-latest.xpi")
sha256sums=('7a1194150eaa2aea530cba4532ad8db32bf9c617f1d18a4bca19f89b7c455a21')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/VacuumPlacesImproved@lultimouomo-gmail.com.xpi"
  popd
}
