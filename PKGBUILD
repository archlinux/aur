# Maintainer: mfw <espadonne@outlook.com>

pkgname=fuss
pkgver=1.2.7
pkgrel=1
pkgdesc='A tree utility for dirty git files, written in modern Fortran'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/FortranGoingOnForty/fuss'
license=('MIT')
depends=('glibc' 'git' 'fzf')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fuss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cfbf3194f5e24afb564b54fba3d3478f46e0298046e3ec75cd5191f956d5d0e5')

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
