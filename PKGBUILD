# Maintainer: Thamer Alharbi
pkgname=baseer
pkgver=0.2.0
pkgrel=1
pkgdesc="Binary analysis tool (ELF, TAR, disassembler, debugger, decompiler)"
arch=('x86_64')
url="https://github.com/thxa/baseer"
license=('MIT')
depends=('gcc' 'make')
source=("https://github.com/thxa/baseer/archive/refs/tags/v${pkgver}.tar.gz")
# sha256sums=('0cc3b382b4ec0cd41c1da6c3701810905d7e7e7a7465e9af66fbf692d0f20f93')

build() {
  cd "$srcdir/baseer-$pkgver"
  make
}

package() {
  cd "$srcdir/baseer-$pkgver/build"
  install -Dm755 baseer "$pkgdir/usr/bin/baseer"
}
