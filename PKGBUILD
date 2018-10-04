# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=jellyfish
pkgver=2.2.10
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

sha256sums=('8988550dfb30ca077c7ddf77d382b87d39749a2e95c0eb459d819bbddd6097cc')
