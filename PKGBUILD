# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.39.1
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
sha256sums_x86_64=('bbf8d0024a7dfd10322089df1be9e2903bd6a8a055e249a8963a7445ce0a94c7')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.tar.zst")
sha256sums_aarch64=('936d2f8e9f3a926460d70f19232fa7289e3ce649ea2afa30209ad7e69ffc6549')

package() {
  install -Dm755 "$srcdir/pi-ui" "$pkgdir/usr/bin/pi-ui"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
