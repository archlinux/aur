# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.46.0
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
sha256sums_x86_64=('ed7295d72ee2ba773ff46ef9b7548cc1004bb8b502037d501481cd1a222c01e2')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.tar.zst")
sha256sums_aarch64=('0494c144e63c7abdbc2855ce7b85819ac47d3860def84d5e6fe2d82c3338c81b')

package() {
  install -Dm755 "$srcdir/pi-ui" "$pkgdir/usr/bin/pi-ui"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
