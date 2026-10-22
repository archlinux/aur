# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-run-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-hosting made simple"
arch=('x86_64')
url="https://run.omni.dev"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
source=("https://github.com/omnidotdev/run-cli/archive/v$pkgver.tar.gz")

build() {
  cd "run-cli-$pkgver"
  cargo build --release
}

package() {
  cd "run-cli-$pkgver"
  install -Dm755 "target/release/run" "$pkgdir/usr/bin/run"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('920a8b4d562c54c7bdb3c0cb54763401ccfc243968a920ea5c30ef67a64b8b13')
