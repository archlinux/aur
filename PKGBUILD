# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=hex
pkgver=0.1.2
pkgrel=1
pkgdesc="Futuristic take on hexdump"
arch=('x86_64')
url="https://github.com/sitkevij/hex"
license=(MIT)
makedepends=(git rust)
source=(https://github.com/sitkevij/hex/archive/v${pkgver}.tar.gz)
sha512sums=('fae7d2102c53e188235c943f9c37021d9536055f4fb3e24ff2f2e9b2dadcfce42d8bb58c802394138ff91b683ada82a9c04ab42d225bb62bed54859f5ca88a27')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/hex "$pkgdir"/usr/bin/hex
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}

# vim:set ts=2 sw=2 et:

