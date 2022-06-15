# Maintainer: Polis Minus <polisminus2247@tuta.io>
pkgname=activate-linux
pkgver=0.0.2
_pkg="$pkgname-$pkgver"
pkgrel=2
pkgdesc="The \"Activate Windows\" watermark ported to Linux with Xlib and cairo in C"
arch=("x86_64")

url='https://github.com/MrGlockenspiel/activate-linux'
makedepends=('make' 'clang' 'pkgconf' 'libxfixes' 'libxinerama')
depends=('cairo' 'libxi' 'libx11' 'libxt')
conflicts=('activate-linux-git')
license=('custom')
sha512sums=('7ddbf3c1f9ee54b4d8e71c3bd8eaa823d83390ed9c6c915fc1d9f7abcab6472692465da9cede5171058be8160ab19ea41c4f8d119923f1595eb66d3247e96890')

source=("https://github.com/MrGlockenspiel/activate-linux/archive/refs/tags/v0.0.2.tar.gz")

build() {
  cd "$_pkg"
  make
}

package() {
  cd "$_pkg"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D activate-linux "$pkgdir/usr/bin/activate-linux"
}
