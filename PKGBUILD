# Maintainer: <Azad Zeynalov>
pkgname=khazarfetch-git
pkgver=2bd6e0c
pkgrel=1
pkgdesc="Minimal fetch tool"
arch=('x86_64')
url="https://github.com/khazar-os-linux/khazarfetch"
license=('GPL-v3.0')
source=("git+https://github.com/khazar-os-linux/khazarfetch.git")
sha256sums=('SKIP')
depends=(
  'inetutils'
  'usbutils'
  'xorg-xrandr'
)

pkgver() {
    cd "$srcdir/khazarfetch"
    git describe --tags --abbrev=0 2>/dev/null || git rev-parse --short HEAD
}

build() {
    cd "$srcdir/khazarfetch"
    g++ -o "$pkgname" khazarfetch.cpp
}

package() {
    install -Dm755 "$srcdir/khazarfetch/$pkgname" "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}

