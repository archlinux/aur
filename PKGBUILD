# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Polis Minus <polisminus2247@tuta.io>
pkgname=activate-linux
pkgver=1.2.0
_pkg="$pkgname-$pkgver"
pkgrel=1
pkgdesc="The \"Activate Windows\" watermark ported to Linux with Xlib and cairo in C"
arch=("x86_64")
url='https://github.com/MrGlockenspiel/activate-linux'
makedepends=('make' 'clang' 'pkgconf')
depends=('cairo' 'libx11' 'libxi' 'libxt' 'libxrandr' 'libxfixes' 'libxinerama' 'wayland' 'wayland-protocols' 'pango' 'libxext')
optdepends=('libconfig')
license=('GPL3')
options=('!buildflags' '!makeflags')
sha512sums=('d95e6c7739f84f80aa13537188952d1c93f549b4775142d822fe8ed31e2b34ab26b0b4cdb04eed112d93109e575fc2503c97c3f95e685d4d42a6644a7eaeae69')

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
