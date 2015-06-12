# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock
pkgver=0.9.5.0
pkgrel=1
pkgdesc='Finally, an efficient blocker. Easy on CPU and memory.'
url=https://github.com/chrisaljoudi/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
source=("uBlock-$pkgver.xpi::https://github.com/chrisaljoudi/uBlock/releases/download/$pkgver/uBlock.firefox.xpi")
sha256sums=('f352c719c8c6d121b190bb2424e521f3cedeee932864735f555d45ff65920e91')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{2b10c1c8-a11f-4bad-fe9c-1c11e82cac42}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
