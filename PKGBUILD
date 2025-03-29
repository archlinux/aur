# Maintainer: <Azad Zeynalov>
pkgname=khazarfetch-git
pkgver=2bd6e0c
pkgrel=1
pkgdesc="Minimal fetch tool"
arch=('x86_64')
url="https://github.com/khazar-os-linux/khazarfetch"
license=('GPL-3.0')
source=("git+https://github.com/khazar-os-linux/khazarfetch.git")
sha256sums=('SKIP')
depends=(
  'inetutils'
  'usbutils'
  'xorg-xrandr'
)
makedepends=('make' 'gcc')

pkgver() {
    cd "$srcdir/khazarfetch"
    git describe --tags --abbrev=0 2>/dev/null || git rev-parse --short HEAD
}

build() {
    cd "$srcdir/khazarfetch"
    make
}

package() {
    cd "$srcdir/khazarfetch"
    make DESTDIR="$pkgdir" install
}

