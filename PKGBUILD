# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-cli
pkgver=0.6.0
pkgrel=1
pkgdesc="Agentic CLI for the Omni ecosystem"
arch=('x86_64')
url="https://cli.omni.dev"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/omnidotdev/cli/archive/v$pkgver.tar.gz")

build() {
  cd "cli-$pkgver"
  cargo build --release
}

package() {
  cd "cli-$pkgver"
  install -Dm755 "target/release/omni" "$pkgdir/usr/bin/omni"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('ec22f1abeac34bd6c047d8b84f049e2c312a6db466e3ac058989d6be326d8441')
