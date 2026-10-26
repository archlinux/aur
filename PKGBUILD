# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gossamer
pkgver=0.75.1
pkgrel=1
pkgdesc="Gossamer language toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/danpozmanter/gossamer"
license=('Apache-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::$url/releases/download/v$pkgver/gos-$pkgver-linux-aarch64.tar.gz")

sha256sums_x86_64=('24cbe1425459381b0aba27431b5ef47cfe2167b31910bb04c8962df70517df7a')
sha256sums_aarch64=('578da002395ad4c6af228899d013391f1dce470f30fc29fe10e10c307bdf1889')

package() {
  cd "$srcdir/gos-$pkgver-linux-$CARCH"

  install -Dm755 gos "$pkgdir/usr/bin/gos"
  install -Dm644 libgossamer_runtime.a "$pkgdir/usr/lib/libgossamer_runtime.a"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
