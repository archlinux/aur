# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.40.1
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
sha256sums_x86_64=('234c0713d013331c1e1c5e0e4d4e3080ca9a46e8b44df6493b1ac36dab47edb5')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.tar.zst")
sha256sums_aarch64=('de04a21f9fd8e50ec036bb92018d3f8f98eac98b3bd9e30dc9bbd4c59af4e92a')

package() {
  install -Dm755 "$srcdir/pi-ui" "$pkgdir/usr/bin/pi-ui"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
