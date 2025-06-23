# Maintainer: Arjav Jain <arjavjain0703@gmail.com>
pkgname=cargofetch
pkgver=1.1.0
pkgrel=1
pkgdesc="Cargofetch is a lightweight CLI tool written in Rust that fetches metadata about your Rust project."
arch=('x86_64')
url="https://github.com/arjav0703/cargofetch"
license=('MIT')
depends=( 'cargo')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::https://github.com/arjav0703/cargofetch/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('SKIP')  # replace SKIP with real sha512sum or keep SKIP during testing

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
