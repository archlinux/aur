# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.1.1
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.1.1.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('b2cd8cf8606348a7dd6283d3b285cafe4b586027893abdd7f85a2a0685ef7bbf')

build() {
    cd "$srcdir/shuffle-1.1.1"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.1.1"
    DESTDIR="$pkgdir" meson install -C build
}

