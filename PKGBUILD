# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gossamer
pkgver=0.63.0
pkgrel=1
pkgdesc="Gossamer language toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/danpozmanter/gossamer"
license=('Apache-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-aarch64.tar.gz")

sha256sums_x86_64=('a119a6e2a91cc78a5c0e6566ea681e34e7f5fb6964d9621a0d25c26a57bd7782')
sha256sums_aarch64=('8ccbc865bba24e4e7a26b479f81c74e503238b21335e8134d77a031ae173f802')

package() {
  cd "$srcdir/gos-$pkgver-linux-$CARCH"

  install -Dm755 gos "$pkgdir/usr/bin/gos"
  install -Dm644 libgossamer_runtime.a "$pkgdir/usr/lib/libgossamer_runtime.a"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
