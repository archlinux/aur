# Maintainer: mfw <espadonne@outlook.com>

pkgname=fuss
pkgver=1.2.0
pkgrel=1
pkgdesc='A tree utility for dirty git files, written in modern Fortran'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/fuss'
license=('MIT')
depends=('glibc' 'git')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fuss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('901db1bfe2bf9fda55c0f6918bf52fa46e968360ea0e12efa8993646a370d9d1')

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
