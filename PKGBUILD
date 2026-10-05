# Maintainer: Matheus Fillipe <matheus.fillipe@syte.ms>
pkgname=diffler-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Terminal code review for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/matheusfillipe/diffler"
license=('MIT' 'Apache-2.0')
provides=('diffler')
conflicts=('diffler')
source_x86_64=("diffler-$pkgver-x86_64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.17.0/diffler-v0.17.0-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("diffler-$pkgver-aarch64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.17.0/diffler-v0.17.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('de4a36e7bc2208a8cd71ff97ef6dfd25e01ff6dac5dbe4c8b49102951bc6c87f')
sha256sums_aarch64=('f90d886cbcb342333b3cf871b13c1ef149e0d759b562a0dcdc55a4e956614d89')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-musl" ;;
    aarch64) triple="aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "diffler-v0.17.0-$triple/diffler" "$pkgdir/usr/bin/diffler"
  install -Dm644 "diffler-v0.17.0-$triple/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "diffler-v0.17.0-$triple/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
