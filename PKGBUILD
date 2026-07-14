# Maintainer: VxidDev <kolesnikov.stas@proton.me>
pkgname=arc-lang
pkgver=0.4.0.alpha
pkgrel=1
pkgdesc="A simple, interpreted programming language written in C."
arch=('x86_64')
url="https://github.com/VxidDev/Arc"
license=('GPL3')
options=('!debug')
depends=('sdl3' 'sdl3_image' 'curl' 'libffi' 'yyjson')
makedepends=('base-devel')
source=("git+https://github.com/VxidDev/Arc.git#tag=v0.4.0-alpha")
sha256sums=('003a3cf89e7a68ccf87dd3ebd9940de6f0b3ccf8e4c2672a477ae4af300aefb6')

build() {
  cd "Arc"
  make release
}

package() {
  cd "Arc"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
