# Maintainer: Christoph Stahl <christoph.stahl@tu-dortmund.de>
pkgname=similarity-tester
pkgver=3.0.2
pkgrel=1
pkgdesc="SIM tests lexical similarity in natural language texts and in programs in C, C++, Java, Pascal, Modula-2, Miranda, Lisp, and 8086 assembler code"
arch=('any')
url="https://dickgrune.com/Programs/similarity_tester/"
license=('BSD')
source=("https://dickgrune.com/Programs/similarity_tester/sim_3_0_2.zip" "Make.patch")

    prepare() {
    patch -p1 -i Make.patch
}

build() {
	make -j1 binaries
}

package() {
    make DIR="${pkgdir}/usr" COPY="install -D" install
}
sha256sums=('bd19b52e54411ac247f3fd34c9659c537e81e1a12ea5dfb502208e0246e92012'
            'ba083b44ff219eaa9f9951166ccc768dc2dd782e29e1f77b8abc7e9df3ba758b')
