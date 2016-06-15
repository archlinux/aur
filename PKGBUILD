# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-jumping-git
_gitname=${pkgname%-git*}
pkgver=7.47df671
pkgrel=1
pkgdesc="Minetest mod that adds jumping stuff like trampolines and cushions"
arch=('any')
url="https://github.com/Jeija/minetest-mod-jumping"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git://github.com/Jeija/minetest-mod-jumping.git")
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

