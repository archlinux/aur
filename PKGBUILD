# Maintainer: David Borzek <mail@davidborzek.de>
pkgname=ringo-flow-bin
pkgver=0.14.2
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
source_x86_64=("ringo-flow-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.14.2/ringo-flow-0.14.2-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-flow-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.14.2/ringo-flow-0.14.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('587b1c1fa6d940f0297b20a5e4317f7751bc742fdbe93b97623539bd4ce4a85f')
sha256sums_aarch64=('3411ac6ff7071ba98fbbcb2b278874ef16596b12eacd6b4ada9362584a0282f2')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-flow-$pkgver-$_target/ringo-flow" "$pkgdir/usr/bin/ringo-flow"
}
