# Maintainer: David Borzek <mail@davidborzek.de>
pkgname=ringo-flow-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Declarative telephony scenario test runner for baresip"
arch=('x86_64' 'aarch64')
url="https://github.com/davidborzek/ringo"
license=('MIT')
# baresip/libre/OpenSSL are statically linked into the binary; opus and spandsp
# are linked dynamically (same as the Homebrew formula).
depends=('opus' 'spandsp')
provides=('ringo-flow')
conflicts=('ringo-flow')
source_x86_64=("ringo-flow-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.12.0/ringo-flow-0.12.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-flow-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.12.0/ringo-flow-0.12.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e493dc329d4215b5ecc804dc754710f541799f7be0d79d4d4021e528c2327a40')
sha256sums_aarch64=('507e5e997851c6d0d073c05bc0eca2d754c59ad421c3e4acb6d1aa3f7fc89b8d')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-flow-$pkgver-$_target/ringo-flow" "$pkgdir/usr/bin/ringo-flow"
}
