# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.9.3
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a799b0fba07593648ebef2fc4bc58d9f623d81d539686251ef842ef6ba874e2a')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
