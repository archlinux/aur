# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=kreuzberg
pkgname=kreuzberg-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="High-performance text extraction library - CLI binary"
arch=('x86_64' 'aarch64')
url="https://github.com/kreuzberg-dev/kreuzberg"
license=('MIT')
depends=()
provides=(kreuzberg)
conflicts=(kreuzberg)
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/kreuzberg-dev/$_pkgname/releases/download/v$pkgver/kreuzberg-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/kreuzberg-dev/$_pkgname/releases/download/v$pkgver/kreuzberg-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('02a75b79b47242eb99bfa220cebeca6267213555611c14162124223398ea4217')
sha256sums_aarch64=('4ef6e06ba0f1bbaee84a3f064d6dd2ce3d59f33eddf9461441c63113ad847db7')

package() {
  cd "$srcdir"

  # Find the extracted directory
  _extracted_dir=$(find . -maxdepth 1 -type d -name "kreuzberg-cli-*" | head -1)

  # Install binary
  install -Dm755 "$_extracted_dir/kreuzberg" "$pkgdir/usr/bin/kreuzberg"
}
