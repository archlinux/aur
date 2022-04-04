# Maintainer: Polis Minus <polisminus2247@tuta.io>
pkgname=activate-linux
pkgver=1.0
pkgrel=1
pkgdesc="The \"Activate Windows\" watermark ported to Linux with Xlib and cairo in C"
arch=("x86_64")

url='https://github.com/MrGlockenspiel/activate-linux'
makedepends=('make' 'clang')
depends=('cairo' 'libxi' 'libx11' 'libxt' 'libx11files')
license=('custom')
sha512sums=('SKIP')

source=(git+https://github.com/MrGlockenspiel/activate-linux)

build(){
  cd "$srcdir"/activate-linux
  make
}

package(){
  cd "$srcdir/activate-linux"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D bin/activate_linux "$pkgdir/usr/bin/activate-linux"
}
