# Maintainer: Matheus Fillipe <matheus.fillipe@syte.ms>
pkgname=diffler-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Terminal code review for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/matheusfillipe/diffler"
license=('MIT' 'Apache-2.0')
provides=('diffler')
conflicts=('diffler')
source_x86_64=("diffler-$pkgver-x86_64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.2.7/diffler-v0.2.7-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("diffler-$pkgver-aarch64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.2.7/diffler-v0.2.7-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('11645abda6d6e5157bb5b55716a20d4b58c27694b51712b2cd2695d88aea6174')
sha256sums_aarch64=('10ef2d484ee28007a4ebde17eb01096454c8fbca6aadd79c139dd9b9d06da857')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-musl" ;;
    aarch64) triple="aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "diffler-v0.2.7-$triple/diffler" "$pkgdir/usr/bin/diffler"
  install -Dm644 "diffler-v0.2.7-$triple/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "diffler-v0.2.7-$triple/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
