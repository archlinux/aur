# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.2.1
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc')
source=("shuffle-1.2.1.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('f35f599d96d4a53552e5123a4bf559af45d8b520b7dca6c9075f1d81029a360e')

build() {
    cd "$srcdir/shuffle-1.2.1"
    meson setup --prefix=/usr/bin --buildtype=release build
    meson compile -C build
}

package() {
    cd "$srcdir/shuffle-1.2.1"
    DESTDIR="$pkgdir" meson install -C build
}
