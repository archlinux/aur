# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-harmony-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Templating and syncing engine for project files"
arch=('x86_64')
url="https://harmony.omni.dev"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
source=("https://github.com/omnidotdev/harmony-cli/archive/v$pkgver.tar.gz")

build() {
  cd "harmony-cli-$pkgver"
  cargo build --release
}

package() {
  cd "harmony-cli-$pkgver"
  install -Dm755 "target/release/harmony" "$pkgdir/usr/bin/harmony"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
