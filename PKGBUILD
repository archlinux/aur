# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=hdx-512-git
pkgver=74.35e493e
pkgrel=1
pkgdesc="High Definition Expansion photorealistic, comprehensive texture pack for Minetest"
arch=('any')
url="https://forum.minetest.net/viewtopic.php?id=1583"
license=('GFDL')
depends=('minetest')
makedepends=('git')
optdepends=('hdx-normalmaps-512: matching high resolution normal maps')
provides=('hdx-512')
source=("$pkgname::git://github.com/VanessaE/hdx-512.git")
md5sums=('SKIP')

PKGEXT=.pkg.tar

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/minetest/textures/$pkgname"
  install * "$pkgdir/usr/share/minetest/textures/$pkgname"
}
