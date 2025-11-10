# Maintainer: Inc44
pkgname=bsc-m03
pkgver=0.5.5
pkgrel=1
pkgdesc="High-performance block-sorting data compressor"
arch=('x86_64')
url="https://github.com/IlyaGrebnov/bsc-m03"
license=('GPL-3.0')
makedepends=('git' 'cmake' 'gcc')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/bsc-m03"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/bsc-m03"
  install -Dm755 "build/bsc-m03" "$pkgdir/usr/bin/bsc-m03"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
