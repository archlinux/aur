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
sha256sums=('a806662000c9e03ab3e90f03d8331322c9907feeeee130c499f87d416a84c83d')

build() {
    gcc -O2 -o xback "$srcdir/main.c" \
        $(pkg-config --libs --cflags x11 xrandr libpng libjpeg libwebp)
}

package() {
    install -Dm755 "$srcdir/xback" "$pkgdir/usr/bin/xback"
    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
