# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Wolfgang Popp <mail@wolfgang-popp.de>
# Contributor: Tharre <tharre3@gmail.com>
# Contributor: Damien Flament <damien.flament at gmx dot com>

pkgname=brittany
pkgver=0.12.1.1.x2
pkgrel=1
pkgdesc='Haskell source code formatter'
arch=(x86_64)
url='https://github.com/lspitzner/brittany'
license=(AGPL3)
makedepends=(stack)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('97fc02baba76a42d19847f5a695af7fa1c2699e6cfbf91c2604998d8501c0d75')

build() {
  cd $pkgname-$pkgver
  stack build
}

package() {
  cd $pkgname-$pkgver
  stack install --local-bin-path "$pkgdir/usr/bin"
}

# vim: ts=2 sw=2 et:
