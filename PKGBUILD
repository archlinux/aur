# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-travelnet-git
_gitname=${pkgname%-git*}
pkgver=41.4779487
pkgrel=1
pkgdesc='Network of teleporter-boxes that allow easy travelling to other boxes on the same network (Mod for Minetest)'
arch=('any')
url="https://github.com/Sokomine/travelnet"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/Sokomine/travelnet.git")
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

