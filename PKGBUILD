# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=kreuzberg
pkgname=kreuzberg-bin
pkgver=4.9.1
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
sha256sums_x86_64=('0a21dfe073085f37d62969e61576528ba2a2441446a29910a5fd3a1e5c365c95')
sha256sums_aarch64=('4ae47a29eb3f823ca46f630fed47a2862993296c2854b3a57ab7abf8213d01fa')

package() {
  cd "$srcdir"

  # Find the extracted directory
  _extracted_dir=$(find . -maxdepth 1 -type d -name "kreuzberg-cli-*" | head -1)

  # Install binary
  install -Dm755 "$_extracted_dir/kreuzberg" "$pkgdir/usr/bin/kreuzberg"
}
