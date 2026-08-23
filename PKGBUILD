# Maintainer: hyperpuncher

pkgname=pi-ui-server-bin
pkgver=0.33.1
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
sha256sums_x86_64=('4d276c8a3bcc361da13995379618ce17cd7630a558c8e8a6bcacf4618d53605d')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-server-linux-arm64.tar.zst")
sha256sums_aarch64=('0c008fd66983a0fb72b7250f861c0fbd2b39da4664c8223709ad1a508b57aca3')

package() {
  install -Dm755 "$srcdir/pi-ui-server" "$pkgdir/usr/bin/pi-ui-server"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
