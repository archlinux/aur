# Maintainer: Omni LLC <team@omni.dev>
pkgname=omnidotdev-cli
pkgver=0.5.0
pkgrel=1
pkgdesc="Agentic CLI for the Omni ecosystem"
arch=('x86_64')
url="https://cli.omni.dev"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/omnidotdev/cli/archive/v$pkgver.tar.gz")
sha256sums=('713b3802d69312f3658f3fe648eec343225304482782ee1ba77c7739b8b747f2')

build() {
  cd "cli-$pkgver"
  cargo build --release
}

package() {
  cd "cli-$pkgver"
  install -Dm755 "target/release/omni" "$pkgdir/usr/bin/omni"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
