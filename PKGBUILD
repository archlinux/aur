# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=jellyfish
pkgver=2.3.0
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
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

sha256sums=('3d5b68bdf741acdb119546bfaf52219834f83cea1f47b0caa135fc649d0d6faf')
