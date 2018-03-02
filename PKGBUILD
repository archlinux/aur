# Maintainer: kpcyrd <git@rxv.cc>

pkgname=wasm-gc
pkgver=0.1.1
pkgrel=1
pkgdesc="gc-sections for wasm"
url="https://github.com/alexcrichton/wasm-gc"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexcrichton/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3456890727ff9295cfd49131b9914cd8d7a8fa0feb44b6fa7d13021210750ddcb6393565d7e9bf4c6144c31709c956a447e7e5b1bfca1e17812e61ae44d145a1')

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
