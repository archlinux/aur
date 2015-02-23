# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-refcontrol
pkgver=0.8.17
pkgrel=3
pkgdesc='Control what gets sent as the HTTP Referer on a per-site basis.'
url=http://www.stardrifter.org/refcontrol/
arch=('any')
license=('MPL' 'GPL' 'LGPL')
depends=('firefox')
source=("http://www.stardrifter.org/refcontrol/RefControl-$pkgver.xpi")
sha256sums=('8a5905723acbc92ea1fcb6e524892bf4a64a862bacf666c38baddec042d1531e')

package() {
  local GLOBIGNORE=*.xpi:license.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{455D905A-D37C-4643-A9E2-F6FEFAA0424A}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
  install -D license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
