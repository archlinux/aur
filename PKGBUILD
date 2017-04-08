# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.0.2
pkgrel=1
pkgdesc="Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"
arch=("i686" "x86_64")
url="http://www.bcgsc.ca/platform/bioinfo/software/abyss"
license=("GPL3")
depends=("make" "openmpi" "sqlite")
makedepends=("boost" "sparsehash")
source=("http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/2.0.2/abyss-2.0.2.tar.gz")

build() {
  cd "${pkgname}-${pkgver}" 
  LDFLAGS=-L/usr/lib/openmpi ./configure --prefix=/usr
  make 
}

check() {
  cd "${pkgname}-${pkgver}" 
  make check
}

package() {
  cd "${pkgname}-${pkgver}" 
  make DESTDIR="${pkgdir}" install
}

sha256sums=('d87b76edeac3a6fb48f24a1d63f243d8278a324c9a5eb29027b640f7089422df')
