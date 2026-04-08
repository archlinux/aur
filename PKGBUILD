# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=kreuzberg
pkgname=kreuzberg-bin
pkgver=4.8.0
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
sha256sums_x86_64=('1430f7a0ef0c6802e8ab557eac6d96ec3d469f3cead01108c06d9b8018f5dcf4')
sha256sums_aarch64=('4c9324891ba949f6c241b7526985d7c239c42fac2bbf84f667e7e1e0115ed67a')

package() {
  cd "$srcdir"

  # Find the extracted directory
  _extracted_dir=$(find . -maxdepth 1 -type d -name "kreuzberg-cli-*" | head -1)

  # Install binary
  install -Dm755 "$_extracted_dir/kreuzberg" "$pkgdir/usr/bin/kreuzberg"
}
