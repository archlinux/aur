# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=hdx-normalmaps-512-git
pkgver=19.143b608
pkgrel=1
pkgdesc="High Definition Expansion comprehensive normal maps for Minetest"
arch=('any')
url="https://forum.minetest.net/viewtopic.php?id=1583"
license=('GFDL')
depends=('hdx-512' 'minetest')
makedepends=('git')
provides=('hdx-normalmaps-512')
source=("$pkgname::git://github.com/VanessaE/hdx-normalmaps-512.git")
md5sums=('SKIP')

PKGEXT=.pkg.tar

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$pkgname"
  rm README.md #same as from hdx-512
  mkdir -p "$pkgdir/usr/share/minetest/textures/hdx-512-git"
  install * "$pkgdir/usr/share/minetest/textures/hdx-512-git"
}
