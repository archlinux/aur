# Maintainer: kpcyrd <git@rxv.cc>

pkgname=wasm-gc
pkgver=0.1.6
pkgrel=1
pkgdesc="gc-sections for wasm"
url="https://github.com/alexcrichton/wasm-gc"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexcrichton/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2d00879a914b7741b51d4111930e27020e8a017f3a325abe00394b5a0a02603f4e06c742ba5b4db77f406cc579e31d5b7ad8827ae59c0bf4d48bf84adfd43415')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
