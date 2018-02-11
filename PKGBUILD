# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-fuzz
pkgver=0.5.2
pkgrel=1
pkgdesc="Command line helpers for fuzzing "
url="https://github.com/rust-fuzz/cargo-fuzz"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-fuzz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a8bcb5cc7d1222dc50ce24311c045bf8133e0e1a1fd4a00d2315ba18524a2daf')
sha512sums=('05486fdd09446b340ad67a7c8285a8a1d084fb1c73dd1a90e42c87f4aaa845f4359a7e71c986d61ae7d1e0d02c0ddd465e53fc65fe1c45cc3fceb9a0397c42f3')

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
