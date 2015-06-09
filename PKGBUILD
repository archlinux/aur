# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=jellyfish
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool for fast, memory-efficient counting of k-mers in DNA"

# Note: according to the README, "Support for 32-bits platform has not been
# tested."
arch=("x86_64")
url="http://www.genome.umd.edu/jellyfish.html"

license=("GPL3")
source=("ftp://ftp.genome.umd.edu/pub/jellyfish/jellyfish-${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}
sha1sums=('9ac4817aed0c61a1819b913193b0e312fa4fa9bd')
