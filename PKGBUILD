# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.2.2
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.2.2.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('b97524bd3b0dc7d5ea1df5799ca8ce3553e4f817')

build() {
    cd "$srcdir/shuffle-1.2.2"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.2.2"
    DESTDIR="$pkgdir" meson install -C build
}
