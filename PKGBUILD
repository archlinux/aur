# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=jellyfish
pkgver=2.2.6
pkgrel=1
pkgdesc="A tool for fast, memory-efficient counting of k-mers in DNA"

# Note: according to the README, "Support for 32-bits platform has not been
# tested."
arch=("x86_64")
url="http://www.genome.umd.edu/jellyfish.html"

license=("GPL3")
source=("https://github.com/gmarcais/Jellyfish/releases/download/v${pkgver}/jellyfish-${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

sha256sums=('4532fb003a0494f6473bb97d52467904f631b94f7f9afb0d45b398f6c413692e')
