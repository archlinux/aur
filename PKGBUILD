# Maintainer: FederAndInk <unifai at protonmail dot com>
_npmname=lv_font_conv
_npmver=1.5.3
pkgname=${_npmname} # All lowercase
pkgver=${_npmver}
pkgrel=1
pkgdesc="Rasterize vector fonts for embedded use. Supports subsettings & merge."
arch=(any)
url="https://github.com/lvgl/lv_font_conv#readme"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('d312504e104ec368a9b4571c497aca0c8513400c2bff6ce12a3088d65013211819a3cbaf6114e67a729a7d6f724f0e86d32e40c96d34b6a1a952d62e4ee0486d')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$pkgdir/usr/lib/node_modules/lv_font_conv/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
