# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.2.3
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.2.3.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('397b187b794291ef7be6e38ce7128319db29553b313afeab6dc4abc463246924')

build() {
    cd "$srcdir/shuffle-1.2.3"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.2.3"
    DESTDIR="$pkgdir" meson install -C build
}
