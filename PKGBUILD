# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=minetest-mod-weather-git
_gitname=${pkgname%-git*}
pkgver=7.b2195be
pkgrel=1
pkgdesc="Minetest mod that adds weather"
arch=('any')
url="https://forum.minetest.net/viewtopic.php?f=11&t=5245&sid=2e794f55767fd96363055597bd7998df"
license=('custom')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git://github.com/Jeija/minetest-mod-weather.git")
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

