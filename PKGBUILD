# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.1.2-3
pkgrel=3
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.1.2-3.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('3e7d0ff094b394f1659bf9bd3c930282c0d47ce1ff3bec773c6a5b2ff7be9be8')

build() {
    cd "$srcdir/shuffle-1.1.2-3"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.1.2-3"
    DESTDIR="$pkgdir" meson install -C build
}
