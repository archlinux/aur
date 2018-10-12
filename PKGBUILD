# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-bike-git
_gitname=${pkgname%-git*}
pkgver=32.3e9a039
pkgrel=1
pkgdesc='Bike mod for Minetest. (Mod for Minetest)'
arch=('any')
url="https://gitlab.com/h2mm/bike"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://gitlab.com/h2mm/bike.git")
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

