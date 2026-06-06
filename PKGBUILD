# Maintainer: Velox <velox@velox0.com>
pkgname=thingy-runner
pkgver=1.2.2
pkgrel=1
pkgdesc="Sakura-themed TUI editor with code execution"
arch=('x86_64' 'aarch64')
url="https://github.com/Velox0/thingy"
license=('Unlicense')
depends=('ncurses' 'curl')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/v$pkgver.tar.gz")
sha256sums=('522ed55d2df14cec2c5a4a9a7228230c3ff6a16d71bf30f8d5d4cdfaaa54af33')

build() {
  cd "$pkgname-$pkgver"
  make VERSION="$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/bin/thingy "$pkgdir/usr/bin/thingy-runner"
}
