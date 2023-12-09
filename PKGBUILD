# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=jellyfish
pkgver=2.3.1
pkgrel=1
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
    ./configure --prefix=/usr --enable-python-binding=sys
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

sha256sums=('ee032b57257948ca0f0610883099267572c91a635eecbd88ae5d8974c2430fcd')
