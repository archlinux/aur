# Maintainer: hyperpuncher

pkgname=pi-ui-server-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Use pi-ui in your browser"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/pi-ui"
license=('MIT')
depends=('glibc' 'libgcc')
options=('!strip')
provides=("pi-ui-server=$pkgver")
conflicts=('pi-ui-server')

source=("LICENSE")
sha256sums=('6b7faf66323093e92a63a7d6d0cd20ef3718b77a2192e06cb00466fe870f14cf')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-server-linux-x64.tar.zst")
sha256sums_x86_64=('283896727736bc1bc8f97abdde2c7e48f15b990acc0b7931423155a23a225950')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-server-linux-arm64.tar.zst")
sha256sums_aarch64=('8d10df10807fc4674fdc0805ab7bf4b386a10195c5c2244b96b29d2afe226fe7')

package() {
  install -Dm755 "$srcdir/pi-ui-server" "$pkgdir/usr/bin/pi-ui-server"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
