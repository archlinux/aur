# Maintainer: David Borzek <mail@davidborzek.de>
pkgname=ringo-flow-bin
pkgver=0.11.1
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
source_x86_64=("ringo-flow-$pkgver-x86_64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.11.1/ringo-flow-0.11.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ringo-flow-$pkgver-aarch64.tar.gz::https://github.com/davidborzek/ringo/releases/download/ringo-flow-v0.11.1/ringo-flow-0.11.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('03c104a4ed16cf125d22b1f68393f6eb3b5c25bd1a5543a565db5adb984a9708')
sha256sums_aarch64=('98b4f339c2f737c2af9be9ef69e7d659be6013fd9f6371714bc7cbc7426e729a')

package() {
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "$srcdir/ringo-flow-$pkgver-$_target/ringo-flow" "$pkgdir/usr/bin/ringo-flow"
}
