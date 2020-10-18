# Maintainer: dhn <neilson+aur@sent.com>

pkgname=minetest-mod-caverealms-git
_gitname=${pkgname%-git*}
pkgver=57.9ab6487
pkgrel=1
pkgdesc='A mod for Minetest to add underground realms'
arch=('any')
url="https://github.com/HeroOfTheWinds/minetest-caverealms/"
license=('custom:WTFPL')
depends=()
optdepends=('minetest-usrdir_patch')
makedepends=('git')
provides=("$_gitname")
install=$pkgname.install
source=("$_gitname::git+https://github.com/HeroOfTheWinds/minetest-caverealms.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/caverealms"
  cp -r * "$pkgdir/usr/share/minetest/mods/caverealms"
}

