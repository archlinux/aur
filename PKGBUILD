# Maintainer: Omni LLC <team@omni.dev>
pkgname=omnidotdev-eden
pkgver=0.2.0
pkgrel=1
pkgdesc="Developer onboarding preflight checks"
arch=('x86_64')
url="https://eden.omni.dev"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/omnidotdev/eden-cli/archive/v$pkgver.tar.gz")
sha256sums=('686c83767f0c778e969552e9c6c507bdcd1a8a13434ec23ffdbb023126fcfa85')

build() {
  cd "eden-cli-$pkgver"
  cargo build --release
}

package() {
  cd "eden-cli-$pkgver"
  install -Dm755 "target/release/eden" "$pkgdir/usr/bin/eden"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
