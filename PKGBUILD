# Maintainer: mfw <espadonne@outlook.com>

pkgname=fuss
pkgver=0.7.1
pkgrel=1
pkgdesc='A tree utility for dirty git files, written in modern Fortran'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/fuss'
license=('MIT')
depends=('glibc' 'git')
makedepends=('gcc-fortran' 'make')
source=("git+https://github.com/FortranGoingOnForty/fuss.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd fuss
    make
}

package() {
    cd fuss

    # Install main binary
    install -Dm755 fuss "$pkgdir/usr/bin/fuss"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
