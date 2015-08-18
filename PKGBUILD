# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock-origin
pkgver=1.0.0.1
pkgrel=2
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("uBlock0-$pkgver.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock0.firefox.xpi")
sha256sums=('beda38d6bc306c8a5fe912f5336350fefb69c0c70436f02662c6dc5547efc554')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
