# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-prehistoric_life-git
_gitname=${pkgname%-git*}
pkgver=8.3b730fe
pkgrel=1
pkgdesc='Adds a variety of Dinosaurs. All Dinosaurs are passive as babies but carnivores become aggressive has adults if not tamed. (Mod for Minetest)'
arch=('any')
url="https://github.com/ElCeejoYT/prehistoric_life"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/ElCeejoYT/prehistoric_life.git")
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

