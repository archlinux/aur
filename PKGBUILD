# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-audit
pkgver=0.2.1
pkgrel=1
pkgdesc="Audit Cargo.lock for crates with security vulnerabilities"
url="https://github.com/RustSec/cargo-audit"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/RustSec/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('67c1037014ec5c3925d0cca928425ca41f3ce20eaa06fe4c3f5c476c2feaf926')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
