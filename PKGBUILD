# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-factions-git
_gitname=${pkgname%-git*}
pkgver=10.a92d9da
pkgrel=1
pkgdesc='Minetest factions base mod for usage by other mods'
arch=('any')
url="https://github.com/sapier/factions"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+git://github.com/sapier/factions.git")
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

