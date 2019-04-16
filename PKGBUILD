# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.7.4
pkgrel=2
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a2e543d15193e99b18e93ce8eeb7fb14b505fe94b96e5053f8b3d96c7f554653')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
