# Maintainer: Matheus Fillipe <matheus.fillipe@syte.ms>
pkgname=diffler-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="Terminal code review for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/matheusfillipe/diffler"
license=('MIT' 'Apache-2.0')
provides=('diffler')
conflicts=('diffler')
source_x86_64=("diffler-$pkgver-x86_64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.1.12/diffler-v0.1.12-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("diffler-$pkgver-aarch64.tar.gz::https://github.com/matheusfillipe/diffler/releases/download/v0.1.12/diffler-v0.1.12-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('eb5ab4ee0c89e2c3f01a567a5ccfb06241611041b501e4cbedc177f25580b649')
sha256sums_aarch64=('226d32721ba3bd38d69e8d587a108af9107f3e87fc0811d54d4c9ef9bc7ddd74')

package() {
  local triple
  case "$CARCH" in
    x86_64) triple="x86_64-unknown-linux-musl" ;;
    aarch64) triple="aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "diffler-v0.1.12-$triple/diffler" "$pkgdir/usr/bin/diffler"
  install -Dm644 "diffler-v0.1.12-$triple/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "diffler-v0.1.12-$triple/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
