pkgname=qrx-bin
pkgver=0.3.0
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

sha256sums_x86_64=("64276fe4d2a0113f4974ab6c81f356b2260780371b9bb752fa8dae7cfca14fe1")
sha256sums_aarch64=("6d5c4bd38433feb9346a0d9e8db2509584c704f1a080262cb7c1682fab7ec8c0")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "qrx-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "qrx-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "qrx" "$pkgdir/usr/bin/qrx"
}
