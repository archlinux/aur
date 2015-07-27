# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock-origin
pkgver=1.0.0.0
pkgrel=2
pkgdesc='An efficient blocker add-on for your browser. Fast, potent, and lean.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
conflicts=('firefox-extension-ublock')
source=("uBlock0-$pkgver.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock0.firefox.xpi")
sha256sums=('b586dea639524752fdfd81901ce7ff247955df0f8bc094fd00484175c5fb452b')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
