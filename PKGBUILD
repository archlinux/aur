# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-fuzz
pkgver=0.5.1
pkgrel=1
pkgdesc="Command line helpers for fuzzing "
url="https://github.com/rust-fuzz/cargo-fuzz"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-fuzz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('afb5f255ab03034b40d4d1bb8708e54722b1321ace10c3928bd87d9572b33633')
sha512sums=('d91aca6d1263402252e300bbecfc403e53b2454c28197eabe8f34f855b6766a650b3c70f4458e9a688d6eb8e2ea3721f91004c4f752c3fcc905825414b59d0e4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
