pkgname=qrx-bin
pkgver=0.4.5
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

sha256sums_x86_64=("294d1fc2b4a8ad9e028e1a58fdf6f807d469e4ffc98e23ae67273bc1d4bcaf9a")
sha256sums_aarch64=("52da6d4d57369ca1b4b023e8988c1739cdc8f5b972dd1196c5f411e984705331")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "qrx-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "qrx-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "qrx" "$pkgdir/usr/bin/qrx"
}
