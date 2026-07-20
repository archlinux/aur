# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gossamer
pkgver=0.32.1
pkgrel=1
pkgdesc="Gossamer language toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/danpozmanter/gossamer"
license=('Apache-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-aarch64.tar.gz")

sha256sums_x86_64=('60b188d589206878b216dd379a3d7e4792c1bdc320b970d7a7ff0167d22281af')
sha256sums_aarch64=('e928256590cd5a1a3cce6f63f36e1f3974e39edb56edc5001e39cf6aebcbee72')

package() {
  cd "$srcdir/gos-$pkgver-linux-$CARCH"

  install -Dm755 gos "$pkgdir/usr/bin/gos"
  install -Dm644 libgossamer_runtime.a "$pkgdir/usr/lib/libgossamer_runtime.a"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
