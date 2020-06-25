# Maintainer: Chris Lane <aur at chrislane dot com>
pkgname=colemak-mod-dh-git
pkgver=r51.9a0a7f1
pkgrel=1
pkgdesc="A Colemak mod for more comfortable typing"
url="https://colemakmods.github.io/mod-dh/"
license=('GPL')
arch=('any')
makedepends=('git' 'moreutils')
source=("$pkgname"::"git+https://github.com/ColemakMods/mod-dh")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make generate
}

package() {
  cd "$srcdir/$pkgname"
  KEYMAP_PREFIX=$pkgdir/usr/share/kbd/keymaps make install
}

# vim:set ts=2 sw=2 et:
