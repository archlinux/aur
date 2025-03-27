# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.3.2
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.3.2.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('258c4d56a81592558d052f19bb2274efdaeb6af4553f40475ced8e313fe5be52')

build() {
    cd "$srcdir/shuffle-1.3.2"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.3.2"
    DESTDIR="$pkgdir" meson install -C build
}
