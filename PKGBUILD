# Maintainer: shellkr <revoltism+AUR$gmail.com>
# Maintainer: michaelkl <michaelkl@mail.ru>

pkgname=minetest-mod-mobs_redo-git
_gitname=${pkgname%-git*}
pkgver=52.804f8b9a0c
pkgrel=1
pkgdesc='Mobs Redo mod for Minetest'
arch=('any')
url="https://notabug.org/tenplus1/mobs_redo"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://notabug.org/tenplus1/mobs_redo.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/mobs"
  cp -r * "$pkgdir/usr/share/minetest/mods/mobs"
}

