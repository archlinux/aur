# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=elfx86exts
pkgver=0.2.0
pkgrel=1
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use"
arch=('x86_64')
url="https://github.com/pkgw/elfx86exts"
license=(MIT)
makedepends=(cargo)
source=("$pkgname.tar.tar"::https://crates.io/api/v1/crates/elfx86exts/$pkgver/download)
sha512sums=('6329c457d91f3bc106b722500b040eaadf078f32e3d0205a9d700ce19ccce12059a75660aafd4160e48485701eed6459309ee6dcda7df7da2ffe1840b0ddb28c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/elfx86exts "$pkgdir"/usr/bin/elfx86exts
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
