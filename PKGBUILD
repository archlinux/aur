# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gossamer
pkgver=0.30.0
pkgrel=1
pkgdesc="Gossamer language toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/danpozmanter/gossamer"
license=('Apache-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-aarch64.tar.gz")

sha256sums_x86_64=('0fbd70f1f30c15bb056950e3058ca909cccd47bb1cfc6e68a6816d03286282cd')
sha256sums_aarch64=('4832c3f561f651da7b6a78b8105a41cc3b3cfeb9a7b4a956e70fe4cdb75c591c')

package() {
  cd "$srcdir/gos-$pkgver-linux-$CARCH"

  install -Dm755 gos "$pkgdir/usr/bin/gos"
  install -Dm644 libgossamer_runtime.a "$pkgdir/usr/lib/libgossamer_runtime.a"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
