# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Polis Minus <polisminus2247@tuta.io>
pkgname=activate-linux
pkgver=1.1.0
_pkg="$pkgname-$pkgver"
pkgrel=3
pkgdesc="The \"Activate Windows\" watermark ported to Linux with Xlib and cairo in C"
arch=("x86_64")
url='https://github.com/MrGlockenspiel/activate-linux'
makedepends=('make' 'clang' 'pkgconf')
depends=('cairo' 'libx11' 'libxi' 'libxt' 'libxrandr' 'libxfixes' 'libxinerama' 'wayland' 'wayland-protocols')
optdepends=('libconfig')
license=('GPL3')
options=('!buildflags' '!makeflags')
sha512sums=('629e2bba62f65db1351f0ae94e604b401c39021aaf429d26d31c3f984d05bdf06374797bec37416f119516d6d226599be04f68097659d19e05bf2dfb1971aba4')

source=("https://github.com/MrGlockenspiel/activate-linux/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pkg"
  make #--silent
}

package() {
  cd $_pkg
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D activate-linux "$pkgdir/usr/bin/activate-linux"
}
