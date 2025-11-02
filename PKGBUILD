# Maintainer: Haoyuan Li <lihaoyuan0506@gmail.com>
pkgname=hitpag
pkgver=2.0.3
pkgrel=1
pkgdesc="An intelligent compression/decompression software."
arch=('x86_64')
url="https://github.com/Hitmux/hitpag"
license=('AGPL3')
source=("hitpag-2.0.3.tar.gz::https://api.github.com/repos/Hitmux/hitpag/tarball/v2.0.3")
sha256sums=('SKIP')
depends=()
makedepends=('cmake' 'make')
options=('!debug')

build() {
  cd "$srcdir"
  tar -xzf "$pkgname-$pkgver-tarball"
  local _extracted_dir=$(ls -d Hitmux-hitpag-*)
  cd "$_extracted_dir"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  local _extracted_dir=$(ls -d Hitmux-hitpag-*)
  cd "$srcdir/$_extracted_dir/build"
  install -Dm755 hitpag "$pkgdir/usr/bin/hitpag"
}
