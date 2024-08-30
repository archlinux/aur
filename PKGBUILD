# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.1.2
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.1.2.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('b1a09c68f76fde6a3f85c6675678d0ca5913a7505fe1207e0ce4f282792ff498')

build() {
    cd "$srcdir/shuffle-1.1.2"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.1.2"
    DESTDIR="$pkgdir" meson install -C build
}
