# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=jellyfish
pkgver=2.3.0
pkgrel=2
pkgdesc="A tool for fast, memory-efficient counting of k-mers in DNA"

# Note: according to the README, "Support for 32-bits platform has not been
# tested."
arch=("x86_64")
url="http://www.genome.umd.edu/jellyfish.html"

# FIXME: in v2.3.0+ the LICENSE file says GPL3 or BSD (changed from just GPL3),
# but tarball is missing the BSD license.  Add BSD license once it's included.
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

sha256sums=('e195b7cf7ba42a90e5e112c0ed27894cd7ac864476dc5fb45ab169f5b930ea5a')
