# Maintainer: shellkr <revoltism+AUR$gmail.com>

_gitname=minetest-mod-jumping
pkgname=minetest-mod-jumping-git
pkgver=7.47df671
pkgrel=1
pkgdesc="Minetest mod that adds jumping stuff like trampolines and cushions"
arch=('any')
url="https://github.com/Jeija/minetest-mod-jumping"
license=('custom')
depends=('minetest')
makedepends=('git')
provides=('minetest-mod-jumping')
install=('minetest-mod-jumping-git.install')
source=("$_gitname::git://github.com/Jeija/minetest-mod-jumping.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/$_gitname"
  cp -r * "$pkgdir/usr/share/minetest/mods/$_gitname"
}

