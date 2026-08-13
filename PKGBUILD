# Maintainer: hyperpuncher

pkgname=pi-ui-server-bin
pkgver=0.26.1
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
sha256sums_x86_64=('20aeaf948bc0e6377297037e4860f876de9621ff3350c854d1023dea629b7d06')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-server-linux-arm64.tar.zst")
sha256sums_aarch64=('95bfea674b7516ecd2a2e93bbc53fe90993fd865b73b2616eab676e1fdaa21e5')

package() {
  install -Dm755 "$srcdir/pi-ui-server" "$pkgdir/usr/bin/pi-ui-server"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
