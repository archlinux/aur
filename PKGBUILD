# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=jrsonnet
pkgver=0.5.0
_pkgver=0.5.0-pre8-test
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/CertainLach/jrsonnet"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/CertainLach/$pkgname/archive/v$_pkgver.tar.gz")
sha512sums=('SKIP') # skipping for the pre-release

build() {
  cd "$pkgname-$_pkgver"

  cargo build --release --locked --features legacy-this-file
}

check() {
  cd "$pkgname-$_pkgver"

  cargo test --release --locked --features legacy-this-file
}

package() {
  cd "$pkgname-$_pkgver"

  install -Dm755 "target/release/jrsonnet" "$pkgdir/usr/bin/jrsonnet"
}
