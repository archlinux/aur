# Maintainer: shellkr <revoltism+AUR$gmail.com>

_gitname=minetest-mod-weather
pkgname=minetest-mod-weather-git
pkgver=7.b2195be
pkgrel=1
pkgdesc="Minetest mod that adds weather"
arch=('any')
url="https://forum.minetest.net/viewtopic.php?f=11&t=5245&sid=2e794f55767fd96363055597bd7998df"
license=('custom')
depends=('minetest')
makedepends=('git')
provides=('minetest-mod-weather')
install=('minetest-mod-weather-git.install)
source=("$_gitname::git://github.com/Jeija/minetest-mod-weather.git")
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

