# Maintainer: hyperpuncher

pkgname=pi-ui-server-bin
pkgver=0.24.0
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
sha256sums_x86_64=('613665adbba43f099e4cbc2ac643786e566234221d1b9582429c746c13eb46fd')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-server-linux-arm64.tar.zst")
sha256sums_aarch64=('d56c7c6dcbc29ad554c615662f981a336f3e4315cf15186f632cfe752bd7afb3')

package() {
  install -Dm755 "$srcdir/pi-ui-server" "$pkgdir/usr/bin/pi-ui-server"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
