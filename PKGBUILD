# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.0.2
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('meson' 'ninja' 'gcc' 'glibc')
makedepends=('meson' 'ninja')
source=("shuffle-1.0.2.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('d29462487ab600ea4db49b8d89926c5c81cb2149d0938d82de35c29b429b94c6')

build() {
    cd "$srcdir/shuffle-1.0.2"
    mkdir builddir
    meson setup builddir --buildtype=release --prefix=/usr/bin
    meson compile -C builddir
}

package() {
    cd "$srcdir/shuffle-1.0.2"
    DESTDIR="$pkgdir" meson install -C builddir
}
