# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/editorconfig-geany

pkgname=editorconfig-geany
pkgver=0.1
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('x86_64' 'i686')
url="https://github.com/editorconfig/editorconfig-geany"
license=('GPL')
depends=('geany' 'editorconfig-core-c')
_gitversion="de6ff50b86b34297b3425f9c5fc64b83c64578c1"
source=("https://github.com/editorconfig/editorconfig-geany/archive/$_gitversion.tar.gz")
sha256sums=('388c1e46cb7d49b33e4b51a28e409c71bd8c516d9a5208dde310a650532130f1')

build() {
  cd "$srcdir/$pkgname-$_gitversion/"
  make EDITORCONFIG_PREFIX=/usr
}

package() {
  install -Dm644 "$srcdir/$pkgname-$_gitversion/$pkgname.so" "$pkgdir/usr/lib/geany/$pkgname.so"
  install -Dm644 "$srcdir/$pkgname-$_gitversion/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
