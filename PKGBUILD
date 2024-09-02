# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.2.0
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.2.0.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('e71ced2e38b1306036444fd568bf8f456151a725615c99ea75fb81aca3b02b00')

build() {
    cd "$srcdir/shuffle-1.2.0"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.2.0"
    DESTDIR="$pkgdir" meson install -C build
}
