# Maintainer: mfw <espadonne@outlook.com>

pkgname=fuss
pkgver=1.2.5
pkgrel=1
pkgdesc='A tree utility for dirty git files, written in modern Fortran'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/fuss'
license=('MIT')
depends=('glibc' 'git')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fuss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8cd0cf0c4826eb47c52e89955ed576b524be56fe35cbc5df7d9a252b22fa477')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"

    # Install main binary
    install -Dm755 fuss "$pkgdir/usr/bin/fuss"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
