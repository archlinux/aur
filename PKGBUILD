# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.1.0.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('7cbc7b2c2d78b2be7f3d8013c3ebc1aa54cd2fc8bab29f2728d941f374630802')

build() {
    cd "$srcdir/shuffle-1.1.0"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.1.0"
    DESTDIR="$pkgdir" meson install -C build
}

