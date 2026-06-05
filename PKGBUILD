# Maintainer: Klomix <main.klomix@gmail.com>

pkgname=copyklom
pkgver=3.0
pkgrel=1
pkgdesc="GUI backup utility for Linux with full, incremental and differential backup support"
arch=('x86_64')
url="https://github.com/Klomix/CopyKlom"
license=('MIT')
depends=('qt6-base' 'tar' 'cronie' 'rsync')
makedepends=('cmake' 'make' 'gcc' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Klomix/CopyKlom/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/CopyKlom-$pkgver"
  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/CopyKlom-$pkgver"
  install -Dm755 build/CopyKlom "$pkgdir/usr/bin/copyklom"
}
