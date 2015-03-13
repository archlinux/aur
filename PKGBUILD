# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock
pkgver=0.9.0.0
pkgrel=1
pkgdesc='Finally, an efficient blocker. Easy on CPU and memory.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
source=("uBlock-$pkgver.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock.firefox.xpi")
sha256sums=('f023e9758bd3c5ce6d2a237d26a30aac52e9ed759e2e309eac5afe2b84f46fd2')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{2b10c1c8-a11f-4bad-fe9c-1c11e82cac42}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
