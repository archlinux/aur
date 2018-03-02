# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-asm
pkgver=0.1.11
pkgrel=1
pkgdesc="Cargo subcommand that shows the assembly or llvm-ir generated for Rust code"
url="https://github.com/gnzlbg/cargo-asm"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnzlbg/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8fac71f85a7981287364d00ac3004196ec510e1fb336b60ca8f4595ae4f53a61')

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
