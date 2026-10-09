# Maintainer: GSET Team <https://github.com/Crazygiscool/GSETLang>
pkgname=gset
pkgver=3.3.0
pkgrel=1
pkgdesc="Generic Syntax Extension Tool - write in any language syntax, compile to any language"
arch=('x86_64' 'aarch64')
url="https://github.com/Crazygiscool/GSETLang"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Crazygiscool/GSETLang/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ae963048193d47b86ab8ab31cf1b8d3ca86f5a21b3727ad50623594000c291b0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked -p gset-cli
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/gset "$pkgdir/usr/bin/gset"
}
