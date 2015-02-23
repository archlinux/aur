# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-stylish
pkgver=2.0.1
pkgrel=3
pkgdesc='Restyle the web with Stylish, a user styles manager.'
url=https://userstyles.org
arch=('any')
license=('GPL3')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/2108/stylish-$pkgver-an+tb+sm+fx.xpi")
sha256sums=('f3770e9b6479f0b14dee59c806c93c615b3fa8858121fa1a6cd7c9d3d1cf26c1')

package() {
  local GLOBIGNORE=*.xpi:COPYING
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{46551EC9-40F0-4e47-8E18-8E5CF550CFB8}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
