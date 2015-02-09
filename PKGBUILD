# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-cookie-controller
pkgver=3.7
pkgrel=2
pkgdesc='Buttons for managing cookies, cookie permissions, and site cookie exceptions.'
url=https://addons.mozilla.org/en-US/firefox/addon/cookie-controller
arch=('any')
license=('custom:MPLv2')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/334572/cookie_controller-$pkgver-fx.xpi")
sha256sums=('39565e7c38b762c5de800f068251191e633f460b13537b1f89b78efcc73c7640')

prepare() {
  find -type f -executable -not -name \*.xpi -exec chmod a-x {} +
}

package() {
  local GLOBIGNORE=*.xpi:license.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{ac2cfa60-bc96-11e0-962b-0800200c9a66}"

  install -d "$dstdir"
  cp -r * "$dstdir"
  install -D license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
