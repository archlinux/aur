# Maintainer: <Azad Zeynalov>
pkgname=khazarfetch
pkgver=2.5
pkgrel=2
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
    cd "$srcdir/$pkgname"
    git describe --tags --abbrev=0 2>/dev/null || git rev-parse --short HEAD
}

build() {
    cd "$srcdir/$pkgname"
    g++ -o "$pkgname" "$pkgname.cpp"
}

package() {
    install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
