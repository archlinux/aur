# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgbase=shuffle-ascii
pkgver=1.0.1
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('meson' 'ninja' 'gcc' 'glibc')
makedepends=('meson' 'ninja')
source=("shuffle-1.0.1.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('85d3019be2329578f7c28205bf6a889d49bfa84fce492d506beba0259d857ee0')

build() {
    cd "$srcdir/shuffle-1.0.1"
    mkdir builddir
    meson setup builddir --buildtype=release --prefix=/usr/bin
    meson compile -C builddir
}

package() {
    cd "$srcdir/shuffle-1.0.1"
    DESTDIR="$pkgdir" meson install -C builddir
}
