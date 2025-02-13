# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.3.0
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.3.0.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('34c4b1e518f28e86195b96442d9664367a4b0cf73274d6c6e129c49e93ced8e1')

build() {
    cd "$srcdir/shuffle-1.3.0"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.3.0"
    DESTDIR="$pkgdir" meson install -C build
}
