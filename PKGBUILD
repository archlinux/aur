# Maintainer: Ning Sun <n@sunng.info>
pkgname=zemon-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal system monitor for zellij written in Rust"
arch=('x86_64')
url="https://github.com/sunng87/zemon"
provides=('zemon')
license=('MIT')
depends=('glibc')
makedepends=('patchelf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sunng87/zemon/releases/download/v${pkgver}/zemon-linux-x86_64")
sha256sums=('698a2f80e7fb429165df9f13df1160f876d5fd00fed0da59db7d5438436b8fde')

package() {
  patchelf --set-interpreter /usr/lib64/ld-linux-x86-64.so.2 "$srcdir/zemon-linux-x86_64"
  install -Dm755 "$srcdir/zemon-linux-x86_64" "$pkgdir/usr/bin/zemon"
}
