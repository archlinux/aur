# Maintainer: RedTide <redtid3 at gmail com>

pkgname=geany-plugin-editorconfig
pkgver=1.34
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('x86_64' 'i686')
url="https://github.com/redtide/editorconfig-geany"
license=('GPL')
depends=("geany>=$pkgver" 'editorconfig-core-c')
source=(
    "$pkgname"::"git+https://github.com/redtide/editorconfig-geany"
)
md5sums=(
    'SKIP'
)
build() {
  cd "$srcdir/$pkgname/"
  make EDITORCONFIG_PREFIX=/usr
}
package() {
  install -Dm644 "$srcdir/$pkgname/$pkgname.so" "$pkgdir/usr/lib/geany/$pkgname.so"
  install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
