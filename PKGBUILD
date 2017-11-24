# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-fuzz
pkgver=0.5.0
pkgrel=1
pkgdesc="Command line helpers for fuzzing "
url="https://github.com/rust-fuzz/cargo-fuzz"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-fuzz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('537c173952028b2ea05ea3069a67576bb00575bc7abe1071ef0228c83fc6f251')
sha512sums=('c33568a5f9dab16512f0d18e81e98ae9d1114f36401dba7d43dea5b80c57576005c872949f4f97c868fa3a03df621f67254f9cb10313dc5c3a24dba6dd29951e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
