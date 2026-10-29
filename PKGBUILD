# Maintainer: GSET Team <https://github.com/Crazygiscool/GSETLang>
pkgname=gset
pkgver=3.3.3
pkgrel=1
pkgdesc="Generic Syntax Extension Tool - write in any language syntax, compile to any language"
arch=('x86_64' 'aarch64')
url="https://github.com/Crazygiscool/GSETLang"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Crazygiscool/GSETLang/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36aa06bfb2b09f3cbb6602bc38d14c09311e7066a39b2938bd652c62a9a7134f')

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
