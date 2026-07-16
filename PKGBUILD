# Maintainer: Matheus Fillipe <matheus.fillipe@syte.ms>
pkgname=diffler-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal code review for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/matheusfillipe/diffler"
license=('MIT' 'Apache-2.0')
provides=('diffler')
conflicts=('diffler')
source_x86_64=("diffler-$pkgver-x86_64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.6.0/diffler-v0.6.0-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("diffler-$pkgver-aarch64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.6.0/diffler-v0.6.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('883b1b3f58346cd1a1bfe7aaf5113bf079c35e5351429b19797c204e48967a4f')
sha256sums_aarch64=('0a0b405213f1d4270fb630b3a648acd6deb15c636c1281438cfd13524a1c2362')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-musl" ;;
    aarch64) triple="aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "diffler-v0.6.0-$triple/diffler" "$pkgdir/usr/bin/diffler"
  install -Dm644 "diffler-v0.6.0-$triple/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "diffler-v0.6.0-$triple/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
