# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-soccer-git
_gitname=${pkgname%-git*}
pkgver=5.d1b2a6b
pkgrel=1
pkgdesc='A soccer mod for Minetest'
arch=('any')
url="https://github.com/kaeza/minetest-soccer"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/kaeza/minetest-soccer.git")
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

