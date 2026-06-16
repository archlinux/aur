# Maintainer: Matheus Fillipe <matheus.fillipe@syte.ms>
pkgname=diffler-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Terminal code review for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/matheusfillipe/diffler"
license=('MIT' 'Apache-2.0')
provides=('diffler')
conflicts=('diffler')
source_x86_64=("diffler-$pkgver-x86_64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.1.11/diffler-v0.1.11-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("diffler-$pkgver-aarch64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.1.11/diffler-v0.1.11-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('b7695b6eeb5326c591d330a5fcc9f1da4d90957953d994d5019c480701be1ee6')
sha256sums_aarch64=('a9a8808aff1c48421443578c9df1f2375ae7bded385852b59ab845c3a8d2b39b')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-musl" ;;
    aarch64) triple="aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "diffler-v0.1.11-$triple/diffler" "$pkgdir/usr/bin/diffler"
  install -Dm644 "diffler-v0.1.11-$triple/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "diffler-v0.1.11-$triple/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
