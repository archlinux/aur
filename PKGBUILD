# Maintainer: ACM <undertakers_help@yahoo.com>

pkgname=minetest-mod-cucina_vegana-git
_gitname=${pkgname%-git*}
pkgver=293.df3d2b4
pkgrel=1
pkgdesc='Farming and Foodmod for Minetest.'
arch=('any')
url="https://github.com/acmgit/cucina_vegana"
license=('GPL3')
depends=()
optdepends=()
makedepends=('git')
provides=("$_gitname")
source=("$_gitname::git+https://github.com/acmgit/cucina_vegana.git")
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

