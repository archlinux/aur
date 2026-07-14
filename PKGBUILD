# Maintainer: Matheus Fillipe <matheus.fillipe@syte.ms>
pkgname=diffler-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Terminal code review for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/matheusfillipe/diffler"
license=('MIT' 'Apache-2.0')
provides=('diffler')
conflicts=('diffler')
source_x86_64=("diffler-$pkgver-x86_64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.5.1/diffler-v0.5.1-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("diffler-$pkgver-aarch64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.5.1/diffler-v0.5.1-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('d24ad5673b13f19f1dcc847f715a25b1c226ef1137557ce9105d35479307f254')
sha256sums_aarch64=('4c866ffa9b376db88b07e7fe20e771cbcc47bedec74488d621dc923f76ffc5dd')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-musl" ;;
    aarch64) triple="aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "diffler-v0.5.1-$triple/diffler" "$pkgdir/usr/bin/diffler"
  install -Dm644 "diffler-v0.5.1-$triple/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "diffler-v0.5.1-$triple/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
