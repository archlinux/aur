# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=editorconfig-geany
pkgver=0.1
pkgrel=2
pkgdesc="EditorConfig plugin for Geany"
arch=('x86_64' 'i686')
url="https://github.com/editorconfig/editorconfig-geany"
license=('GPL')
depends=('geany' 'editorconfig-core-c')
_gitversion="6506e69f3e85eb2d3eba6e3f1990bd0a1cec72aa"
source=("https://github.com/editorconfig/editorconfig-geany/archive/$_gitversion.tar.gz")
sha256sums=('eab5bb6b20814b1d2432f98959a1a4a9f37ac208e0c7bd9968b4c0cc035c4e38')

build() {
  cd "$srcdir/$pkgname-$_gitversion/"
  make EDITORCONFIG_PREFIX=/usr
}

package() {
  install -Dm644 "$srcdir/$pkgname-$_gitversion/$pkgname.so" "$pkgdir/usr/lib/geany/$pkgname.so"
  install -Dm644 "$srcdir/$pkgname-$_gitversion/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
