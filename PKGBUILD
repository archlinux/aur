# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock
pkgver=0.9.3.0
pkgrel=2
pkgdesc='Finally, an efficient blocker. Easy on CPU and memory.'
url=https://github.com/chrisaljoudi/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
source=("uBlock-$pkgver.xpi::https://github.com/chrisaljoudi/uBlock/releases/download/$pkgver/uBlock.firefox.xpi")
sha256sums=('96f5f0312448b80fb8c974a6611b8dffacf000c5c6c843e1a0b77e9d085d3c01')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{2b10c1c8-a11f-4bad-fe9c-1c11e82cac42}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
