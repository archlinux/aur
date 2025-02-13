# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.3.0
pkgrel=2
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.3.0.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('cc207aac6f57adaaf7f8e2f145f3729303b6e62f1dd7e7fe3c87ce67fe21b2f6')

build() {
    cd "$srcdir/shuffle-1.3.0"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.3.0"
    DESTDIR="$pkgdir" meson install -C build
}
