# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname="firefox-vacuum-places"
pkgver='1.2.1'
pkgrel='2'
pkgdesc='Defragments your Firefox "Places" database (history/bookmarks). This greatly reduces the lag while typing in the address bar and the start-up time.'
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/vacuum-places-improved"
license=('MPL')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/13878/addon-13878-latest.xpi")
sha256sums=('a8cb81e734d3cdd9ec06df205faec8e09effe9d073b442bfcdedf9555eec9e11')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/VacuumPlacesImproved@lultimouomo-gmail.com.xpi"
  popd
}
