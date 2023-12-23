# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=elfx86exts
pkgver=0.6.2
pkgrel=1
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use"
arch=('x86_64')
url="https://github.com/pkgw/elfx86exts"
license=(MIT)
options=('!lto')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pkgw/elfx86exts/archive/elfx86exts@${pkgver}.tar.gz)
sha512sums=('a8b7e9f7d7ef499fe5acd1cb4b2faa74f8ac6b494f3757c5cb415f83036af6edead477fdc8efade4e7a10ade6a499a0b76d0aeee95a650340fd8998f82f1cace')

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
