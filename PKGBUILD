# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.11.0
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e5b632919efa5c9eda2f23d6f69f5fba6b39b215e5d55c632aaa39fa10f9fc98')

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
