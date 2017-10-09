# Maintainer: nano thirteen <nano13@gmx.net>

pkgname=minetest-mod-meshnodes-git
_gitname=${pkgname%-git*}
pkgver=30.5901137
pkgrel=1
pkgdesc="Meshnodes is a Minetest-mod that transforms ordinary minetest nodes into a connected array of replica entities to which players can attach to and manoeuvre."
arch=('any')
url="https://github.com/stujones11/meshnode"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git://github.com/stujones11/meshnode.git")
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

