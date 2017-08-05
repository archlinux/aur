# Maintainer: axionl <axionl@aosc.io>
pkgname=ciel
pkgver=r165.00c837e
pkgrel=1
pkgdesc="A tool for controlling multi-layer file systems and containers."
arch=('i686' 'x86_64')
url="https://github.com/AOSC-Dev/ciel"
license=('MIT')
makedepends=('git' 'make' 'go')

source=($pkgname::git+https://github.com/AOSC-Dev/ciel.git)
md5sums=('SKIP')

package() {
    dir="$srcdir/$pkgname/"
    mkdir -p pkg/ciel/usr/bin
    cd $dir
    git submodule update --init --recursive
    make && make PREFIX=${pkgdir}/usr install && make clean
}
