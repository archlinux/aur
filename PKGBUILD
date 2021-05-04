# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Wolfgang Popp <mail@wolfgang-popp.de>
# Contributor: Tharre <tharre3@gmail.com>
# Contributor: Damien Flament <damien.flament at gmx dot com>

pkgname=brittany
pkgver=0.13.1.1
pkgrel=1
pkgdesc='Haskell source code formatter'
arch=(x86_64)
url='https://github.com/lspitzner/brittany'
license=(AGPL3)
makedepends=(git stack)
source=("git+$url#commit=4d064db674203626fe5011d10874fcbc335ec9b1") # tag: 0.13.1.1
b2sums=('SKIP')

build() {
  cd $pkgname
  stack build
}

package() {
  cd $pkgname
  stack install --local-bin-path "$pkgdir/usr/bin"
}
