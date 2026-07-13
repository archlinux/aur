# Maintainer: Matheus Fillipe <matheus.fillipe@syte.ms>
pkgname=diffler-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal code review for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/matheusfillipe/diffler"
license=('MIT' 'Apache-2.0')
provides=('diffler')
conflicts=('diffler')
source_x86_64=("diffler-$pkgver-x86_64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.5.0/diffler-v0.5.0-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("diffler-$pkgver-aarch64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.5.0/diffler-v0.5.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('9ab559d29bcd7ef488394022cb7e87b3f8d04b6a10362d0629b82e8174af1f41')
sha256sums_aarch64=('b9c1df393eecfe109310eae41c922e45a245562f1b15373d28410d65b50a0b34')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-musl" ;;
    aarch64) triple="aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "diffler-v0.5.0-$triple/diffler" "$pkgdir/usr/bin/diffler"
  install -Dm644 "diffler-v0.5.0-$triple/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "diffler-v0.5.0-$triple/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
