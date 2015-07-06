# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: tfickett <tfickett AT ufl DOT edu>

pkgname=z80-asm
pkgver=2.4.pre3
pkgrel=3
pkgdesc="Assembler, monitor and disassembler for Z80 series CPUs"
arch=('i686' 'x86_64')
url="http://wwwhomes.uni-bielefeld.de/achim/z80-asm.html"
license=('GPL')
source=('http://wwwhomes.uni-bielefeld.de/achim/z80-asm/z80-asm-current.tar.gz')
md5sums=('7c128ce80c576cbf925aca09524641b6')

build() {
    cd "${pkgname}-${pkgver/.p/-p}"
    make
}

package() {
    cd "${pkgname}-${pkgver/.p/-p}"

    mkdir -p "${pkgdir}/usr/bin"
    install -m755 z80-asm z80-mon "${pkgdir}/usr/bin"

    for i in 1 3 5; do
        mkdir -p "${pkgdir}/usr/share/man/man${i}"
        install -m644 doc/man/z80-*.${i} "${pkgdir}/usr/share/man/man${i}"
    done
}
