# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=editorconfig-geany
pkgver=0.1.1
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('x86_64' 'i686')
url="https://github.com/editorconfig/editorconfig-geany"
license=('GPL')
depends=('geany' 'editorconfig-core-c')
_gitversion="ed7b2449c7ec3c903d56c2f5c4c66a094b9f10f8"
source=("https://github.com/editorconfig/editorconfig-geany/archive/$_gitversion.tar.gz")
sha256sums=('b00a6443166a93da6a0c647b82c357e33aa0ce387e5036ce69657b35ff7983c8')

build() {
  cd "$srcdir/$pkgname-$_gitversion/"
  make EDITORCONFIG_PREFIX=/usr
}

package() {
  install -Dm644 "$srcdir/$pkgname-$_gitversion/$pkgname.so" "$pkgdir/usr/lib/geany/$pkgname.so"
  install -Dm644 "$srcdir/$pkgname-$_gitversion/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
