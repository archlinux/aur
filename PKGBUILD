# Maintainer: MadTux <andreasgwilt@gmail.com>

pkgname=minetest-lott-git
pkgver=1.1.0.r79.ge41f502
pkgrel=1
pkgdesc="A Lord of the Rings-based game for the Minetest engine."
arch=('any')
url="https://minetest-lotr.github.io/"
license=('LGPL2')
depends=('minetest')
provides=('minetest-lott')
conflicts=('minetest-lott')

makedepends=('git')
source=("$pkgname::git://github.com/minetest-LOTR/Lord-of-the-Test.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
  cp -r * "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
}
