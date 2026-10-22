# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-run-cli
pkgver=0.1.1
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
sha256sums=('11a41b37ce79dd3a38cc1a9999192a792c7fba5b9074cf88ce0a80ecab8515b7')
