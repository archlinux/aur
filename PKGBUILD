# Maintainer: FederAndInk <unifai at protonmail dot com>
_npmname=lv_font_conv
_npmver=1.5.2
pkgname=${_npmname} # All lowercase
pkgver=${_npmver}
pkgrel=1
pkgdesc="Rasterize vector fonts for embedded use. Supports subsettings & merge."
arch=(any)
url="https://github.com/lvgl/lv_font_conv#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('d146a94524e454ffe99c1f19e2bd870c7c79a76749c7fc541b5fb5e2efd65e8e7d9b0b82ec16a147e067c7feba8caa03ac6d70150c27f59ce8c8cc511ce0fd6e')

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
