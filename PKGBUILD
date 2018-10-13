# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-3d_armor-git
_gitname=${pkgname%-git*}
pkgver=332.7032515
pkgrel=1
pkgdesc='Adds craftable armor that is visible to other players.. (Mod for Minetest)'
arch=('any')
url="https://github.com/stujones11/minetest-3d_armor"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/stujones11/minetest-3d_armor.git")
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

