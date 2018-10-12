# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-playeranim-git
_gitname=${pkgname%-git*}
pkgver=7.560af7e
pkgrel=1
pkgdesc='Makes the head, and the right arm when you are mining, face the way you are facing, similar to Minecraft.. (Mod for Minetest)'
arch=('any')
url="https://github.com/minetest-mods/playeranim"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/minetest-mods/playeranim.git")
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

