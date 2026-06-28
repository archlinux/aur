# Maintainer: David Borzek <mail@davidborzek.de>
pkgname=ringo-flow-bin
pkgver=0.11.0
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
source_x86_64=("ringo-flow-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.11.0/ringo-flow-0.11.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-flow-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.11.0/ringo-flow-0.11.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('bc5ddcf87f77484a04ec9629f3717d5b8221c8c7074c68f143b338fd695c1d67')
sha256sums_aarch64=('f29c0fadadb66bd04d7ff2c7780dcb0464c1d1ca34d9deb27569a083849ca3af')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-flow-$pkgver-$_target/ringo-flow" "$pkgdir/usr/bin/ringo-flow"
}
