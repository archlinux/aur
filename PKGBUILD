# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-ublock
pkgver=0.8.8.3
pkgrel=2
pkgdesc='Finally, an efficient blocker. Easy on CPU and memory.'
url=https://github.com/gorhill/uBlock
arch=('any')
license=('GPL3')
depends=('firefox')
source=("uBlock-$pkgver.xpi::https://github.com/gorhill/uBlock/releases/download/$pkgver/uBlock.firefox.xpi")
sha256sums=('bf3f5b190f6c9ac35cc5ea46a64bd29da384b6c5fddcffd91769efb58e7c1a15')

package() {
  local GLOBIGNORE=*.xpi:LICENSE.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{2b10c1c8-a11f-4bad-fe9c-1c11e82cac42}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
