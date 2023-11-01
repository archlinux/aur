# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=elfx86exts
pkgver=0.5.0
pkgrel=2
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use"
arch=('x86_64')
url="https://github.com/pkgw/elfx86exts"
license=(MIT)
options=('!lto')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/pkgw/elfx86exts/archive/elfx86exts@${pkgver}.tar.gz)
sha512sums=('7caa0518fecba588ec02b053f019123a9f8aaeeed74ece8240e24679e820abb537bd29849e51ca664f7e8effc3d90ed50bae61eda51e83e10be0a988f7eb0626')

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
