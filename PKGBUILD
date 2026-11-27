pkgname=qrx-bin
pkgver=0.4.6
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

sha256sums_x86_64=("4b63ebfa256e9ecd09470b0c29e9e6c234604d9610a6d36357964d62fa9d5465")
sha256sums_aarch64=("afaa93bb0499bfe746380dba0636201380130709825044c97da12279294bdb5d")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "qrx-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "qrx-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "qrx" "$pkgdir/usr/bin/qrx"
}
