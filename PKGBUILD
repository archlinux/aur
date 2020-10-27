# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=elfx86exts
pkgver=0.4.3
pkgrel=1
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use"
arch=('x86_64')
url="https://github.com/pkgw/elfx86exts"
license=(MIT)
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pkgw/elfx86exts/archive/elfx86exts@${pkgver}.tar.gz)
sha512sums=('4f547b89829f65f6c9a00633f02d9b6c4c141c89b511949f9e1a29f54c2f6e0e88c81ef960cb06609700b1a78f314fc66b41a9cc9f6db8e3b871a77fa1345a03')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  install -Dm755 target/release/elfx86exts "$pkgdir"/usr/bin/elfx86exts
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
