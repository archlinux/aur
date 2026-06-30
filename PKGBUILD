pkgname=qrx-bin
pkgver=0.2.2
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

sha256sums_x86_64=("c95449cb4616aed097557ba09529937224805a4878f40398ca55b9fa5330f69f")
sha256sums_aarch64=("0427aad0de35d840b9952bad774675ca18b05ac2c6c1d9d8ae1210dfbcb7b2ad")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "qrx-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "qrx-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "qrx" "$pkgdir/usr/bin/qrx"
}
