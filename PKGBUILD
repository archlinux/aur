# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-immersive_sounds-git
_gitname=${pkgname%-git*}
pkgver=33.70de26b
pkgrel=1
pkgdesc='Immersive Ambience Mod for Minetest. Adds sounds for the settings you are in and music.'
arch=('any')
url="https://github.com/Neuromancer56/MinetestAmbience/"
license=('WTFPL')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/Neuromancer56/MinetestAmbience.git")
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

