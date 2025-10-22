# Maintainer: mfw <espadonne@outlook.com>

pkgname=sniffert
pkgver=0.6.0
pkgrel=1
pkgdesc='Terminal-based disk analyzer inspired by SpaceSniffer, written in Fortran'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/sniffert'
license=('MIT')
depends=('glibc' 'ncurses' 'fzf')
makedepends=('gcc-fortran' 'gcc' 'make')
source=("git+https://github.com/FortranGoingOnForty/sniffert.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd sniffert
    make
}

package() {
    cd sniffert

    # Install main binary
    install -Dm755 sniffert "$pkgdir/usr/bin/sniffert"

    # Install documentation if README exists
    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
