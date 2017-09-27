# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-fuzz
pkgver=0.4.3
pkgrel=1
pkgdesc="Command line helpers for fuzzing "
url="https://github.com/rust-fuzz/cargo-fuzz"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-fuzz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9a3a1e410d3e44f099d4e0754f9ff520f7f66b1f14aedb42ba4e08ad0210128b')
sha512sums=('76544e774875a770be874d0641b2a2fa28889ba2224dd4c72991899d082644e64e65c7be2608788bcf1209a940ccefe4ec56860adff2cfca10dc6b616c69c0e4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
