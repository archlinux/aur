# Maintainer: GSET Team <https://github.com/Crazygiscool/GSETLang>
pkgname=gset
pkgver=3.4.0
pkgrel=1
pkgdesc="Generic Syntax Extension Tool - write in any language syntax, compile to any language"
arch=('x86_64' 'aarch64')
url="https://github.com/Crazygiscool/GSETLang"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Crazygiscool/GSETLang/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95b1609c9eef71612cafcffb80fe83c5f6d86f598d4c4869ff97e46b31845209')

build() {
  # GitHub's codeload tarball for a tag archives to "GSETLang-<ver>"
  # (the leading "v" is dropped), not "$pkgname-$pkgver".
  cd "GSETLang-$pkgver"
  cargo build --release --locked -p gset-cli
}

package() {
  cd "GSETLang-$pkgver"
  install -Dm755 target/release/gset "$pkgdir/usr/bin/gset"
}
