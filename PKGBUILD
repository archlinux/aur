# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=kreuzberg
pkgname=kreuzberg-bin
pkgver=4.9.8
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
sha256sums_x86_64=('7e6f80b2437b0da05764e7a28ed29fb1e745f46f8a2c7e20d8776e02ef8e6bb9')
sha256sums_aarch64=('72b3de0b0cc0d6c261563885d3b1603cbcebf4afdc47e11ee12c8f09dead2dfe')

package() {
  cd "$srcdir"

  # Find the extracted directory
  _extracted_dir=$(find . -maxdepth 1 -type d -name "kreuzberg-cli-*" | head -1)

  # Install binary
  install -Dm755 "$_extracted_dir/kreuzberg" "$pkgdir/usr/bin/kreuzberg"
}
