# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=kreuzberg
pkgname=kreuzberg-bin
pkgver=4.9.6
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
sha256sums_x86_64=('28dc0cfe4d9cbd44a88b2f856ace556d0c5a860e3fe64c4125c1010c35a9f032')
sha256sums_aarch64=('4f39d9aef8bd268130429981fd590fcef2ce66815117287c3fe325b49f8895ae')

package() {
  cd "$srcdir"

  # Find the extracted directory
  _extracted_dir=$(find . -maxdepth 1 -type d -name "kreuzberg-cli-*" | head -1)

  # Install binary
  install -Dm755 "$_extracted_dir/kreuzberg" "$pkgdir/usr/bin/kreuzberg"
}
