pkgname=tempesta-bin
pkgver=0.1.34
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

sha256sums_x86_64=("4a4bcb62c8562ab91804228cf82a2263800eef8a87e0f1f58ca7c31009148c4b")
sha256sums_aarch64=("aec632141bd74bb66e276bdb2b49b9c0691cbc2dbe81bd65ffa19a870d86ef09")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "tempesta-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "tempesta-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 tempesta "$pkgdir/usr/bin/tempesta"
}
