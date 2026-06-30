pkgname=qrx-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="CLI tool to capture a screen region, decode any QR code found, and copy the result to clipboard. (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/qrx"
license=('MIT')
depends=('glibc')
provides=('qrx')
conflicts=('qrx')

source_x86_64=("qrx-x86_64-$pkgver.tar.gz::https://github.com/x71c9/qrx/releases/download/v$pkgver/qrx-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("qrx-aarch64-$pkgver.tar.gz::https://github.com/x71c9/qrx/releases/download/v$pkgver/qrx-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("58da69fa980050b94ae0c38083bf57821ee2eb3efe212490b455073d9a2b617e")
sha256sums_aarch64=("4620d4fe69a82657821fd17abcc18b4761168967803217211c7989f5dc1d5550")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "qrx-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "qrx-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "qrx" "$pkgdir/usr/bin/qrx"
}
