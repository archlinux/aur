# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-adv_spawning-git
_gitname=${pkgname%-git*}
pkgver=16.ec41aa9
pkgrel=1
pkgdesc='An advanced spawning mod for minetest'
arch=('any')
url="https://github.com/sapier/adv_spawning"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+git://github.com/sapier/adv_spawning.git")
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

