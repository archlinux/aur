# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=mesecons-git
pkgver=784.2554164
pkgrel=1
pkgdesc="Minetest mod that adds digital circuitry, similar to Minecraft's redstone."
arch=('any')
url="https://mesecons.net/"
license=('custom')
depends=('minetest')
makedepends=('git')
provides=('mesecons')
source=("$pkgname::git://github.com/minetest-mods/mesecons.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/minetest/mods/$pkgname"
  cp -r * "$pkgdir/usr/share/minetest/mods/$pkgname"
}
