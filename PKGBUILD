# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.38.1
pkgrel=1
pkgdesc="Use pi-ui in your browser"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/pi-ui"
license=('MIT')
depends=('glibc' 'libgcc')
options=('!strip')
provides=("pi-ui=$pkgver" "pi-ui-server=$pkgver")
conflicts=('pi-ui' 'pi-ui-server' 'pi-ui-server-bin')

source=("LICENSE")
sha256sums=('6b7faf66323093e92a63a7d6d0cd20ef3718b77a2192e06cb00466fe870f14cf')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-x64.tar.zst")
sha256sums_x86_64=('c0327d53bb64bfe77b9f82f73e1faeaa6760137471280a3f3d50edc868f26dda')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.tar.zst")
sha256sums_aarch64=('9954f8d339d7d3d3e477677bd4b8c3bc58db23a8f6be8e7f4fbef49471bd203e')

package() {
  install -Dm755 "$srcdir/pi-ui" "$pkgdir/usr/bin/pi-ui"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
