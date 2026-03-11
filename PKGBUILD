# Maintainer: kantiankant <your@email.com>
pkgname=xback
pkgver=1.0
pkgrel=1
pkgdesc="An X11 wallpaper utility that just sucks less"
arch=('x86_64')
url="https://github.com/kantiankant/Xback"
license=('GPL3')
depends=('libx11' 'libxrandr' 'libpng' 'libjpeg' 'libwebp')
makedepends=('pkgconf')
source=("main.c::https://raw.githubusercontent.com/kantiankant/Xback/main/main.c")
sha256sums=('043efe75851838f61b819d1e0d9cacd6e09fba1222d79e59fbb64db07ced508c')

build() {
    gcc -O2 -o xback "$srcdir/main.c" \
        $(pkg-config --libs --cflags x11 xrandr libpng libjpeg libwebp)
}

package() {
    install -Dm755 "$srcdir/xback" "$pkgdir/usr/bin/xback"
    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
