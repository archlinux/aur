# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.3.1
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.3.1.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('5a350c8a492ae8ada063bcface53af58725abc3f58287de7c7d0abc0e29b3caa')

build() {
    cd "$srcdir/shuffle-1.3.1"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.3.1"
    DESTDIR="$pkgdir" meson install -C build
}
