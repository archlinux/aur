# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gossamer
pkgver=0.75.14
pkgrel=1
pkgdesc="Gossamer language toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/danpozmanter/gossamer"
license=('Apache-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-aarch64.tar.gz")

sha256sums_x86_64=('341124280136c3f89b27abd20e2f3e695d915388ff7ae722fe28ae85c0bdd36e')
sha256sums_aarch64=('d0b1b3413e25be8dfe3c4c7da69b155996d3b6945d24ef6758727b7cfb538eb1')

package() {
  cd "$srcdir/gos-$pkgver-linux-$CARCH"

  install -Dm755 gos "$pkgdir/usr/bin/gos"
  install -Dm644 libgossamer_runtime.a "$pkgdir/usr/lib/libgossamer_runtime.a"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
