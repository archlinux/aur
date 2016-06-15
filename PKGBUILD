# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-markers-git
_gitname=${pkgname%-git*}
pkgver=22.52d1b90
pkgrel=1
pkgdesc='markers for the Minetest mod "areas" (Mod for Minetest)'
arch=('any')
url="https://github.com/Sokomine/markers"
license=('custom')
depends=('minetest-mod-areas-git')
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/Sokomine/markers.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
  cp -r * "$pkgdir/usr/share/minetest/mods/${_gitname#*mod-}"
}

