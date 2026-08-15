# Maintainer: hyperpuncher

pkgname=pi-ui-server-bin
pkgver=0.29.0
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
sha256sums_x86_64=('d7ae47990789af15515e69f6a355bd107668d3d90c9e40c9ffaeffdb06919859')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-server-linux-arm64.tar.zst")
sha256sums_aarch64=('cc35636d98302c9d65bbaecd4a9c66c4288e3ee3b74adb9baf409b730cbe05a7')

package() {
  install -Dm755 "$srcdir/pi-ui-server" "$pkgdir/usr/bin/pi-ui-server"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
