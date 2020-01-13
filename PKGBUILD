# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-asm
pkgver=0.1.16
pkgrel=1
pkgdesc="Cargo subcommand that shows the assembly or llvm-ir generated for Rust code"
url="https://github.com/gnzlbg/cargo-asm"
depends=('cargo' 'gcc-libs')
arch=('any')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-asm/${pkgver}/download")
sha256sums=('be6991c30c2e197c29c33ca8544caa94de9531733419ac20ffb629ed95a3bc5d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/cargo-asm" "target/release/cargo-llvm-ir" -t "$pkgdir/usr/bin/"
  install -Dm644 license-mit.md license-apache.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
