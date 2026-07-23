# Maintainer: David Borzek <mail@davidborzek.de>
pkgname=ringo-flow-bin
pkgver=0.12.1
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
source_x86_64=("ringo-flow-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.12.1/ringo-flow-0.12.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-flow-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.12.1/ringo-flow-0.12.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('efc3fa0d35b5c28b2d9cb1900b813e9bc589737ff4c4a74ba598e2a8fd7280a4')
sha256sums_aarch64=('33f9b8cb5c8d294993fa2708cf5d58a188cafffc8686b23630414d3e921355d8')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-flow-$pkgver-$_target/ringo-flow" "$pkgdir/usr/bin/ringo-flow"
}
