pkgname=tempesta-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')
provides=('tempesta')
conflicts=('tempesta')

source_x86_64=("tempesta-x86_64-$pkgver.tar.gz::https://github.com/x71c9/tempesta/releases/download/v$pkgver/tempesta-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("tempesta-aarch64-$pkgver.tar.gz::https://github.com/x71c9/tempesta/releases/download/v$pkgver/tempesta-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("ebbcda5f8389c0e634d4f0fd8f02f0f6584068b5f0e2ed8b2be384f871665a10")
sha256sums_aarch64=("9a77d14c61ea50adb6b196579bdace264a0b9d268ff01c6957b08e9164812266")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "tempesta-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "tempesta-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 tempesta "$pkgdir/usr/bin/tempesta"
}
