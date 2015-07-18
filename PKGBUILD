# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-cookie-controller
pkgver=3.12
pkgrel=1
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
sha256sums=('5c293e7bc487f8c2548c863d3da7232c7dbb45574d76912dc58db0a4a42fc6b8')

package() {
  local GLOBIGNORE=*.xpi:license.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{ac2cfa60-bc96-11e0-962b-0800200c9a66}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
  install -D license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
