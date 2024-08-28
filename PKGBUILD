# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.0.4
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.0.4.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('cfb6e4f07c83b006c3dc16411df487e8413e714be82b94c7aeb1859435181e92')

build() {
    cd "$srcdir/shuffle-1.0.4"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.0.4"
    DESTDIR="$pkgdir" meson install -C build
}

