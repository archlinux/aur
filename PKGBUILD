# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.11.5
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c6f8c208c965a08c3a244608fdb9d142d53083b0d802db3622eea949f4f46111')

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
