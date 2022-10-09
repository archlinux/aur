# Maintainer: Polis Minus <polisminus2247@tuta.io>
pkgname=activate-linux
pkgver=1.0.0
_pkg="$pkgname-$pkgver"
pkgrel=2
pkgdesc="The \"Activate Windows\" watermark ported to Linux with Xlib and cairo in C"
arch=("x86_64")

url='https://github.com/MrGlockenspiel/activate-linux'
makedepends=('make' 'clang' 'pkgconf' 'libxfixes' 'libxinerama')
depends=('cairo' 'libxi' 'libx11' 'libxt' 'wayland' 'wayland-protocols')
conflicts=('activate-linux-git')
license=('custom')
options=('!buildflags' '!makeflags')
sha512sums=('1fc9a8d808742fc3e95ecc4886792748d3abab7a81a6e9df078e18c4f8d5e11588bee7f775496d0e54ebddc281e1afc4d37b075fec3247da011d12ac8dafe4ec')

source=("https://github.com/MrGlockenspiel/activate-linux/archive/refs/tags/v1.0.0.tar.gz")

build() {
  cd "$srcdir/$_pkg"
  make #--silent
}

package() {
  cd $_pkg
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D activate-linux "$pkgdir/usr/bin/activate-linux"
}
