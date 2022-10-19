# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=libmaus
pkgver=2.0.812_release_20220919125234
pkgrel=3
pkgdesc="Bioinformatics data structures and algorithms in C++"
arch=('x86_64')
url=https://gitlab.com/german.tischler/libmaus2
license=('GPL2')
source=(https://gitlab.com/german.tischler/"${pkgname}"2/-/archive/"${pkgver//_/-}"/"${pkgname}"2-"${pkgver//_/-}".tar.gz)
sha256sums=('08e6dee0fcb68253e1edd1e442650104051b096ffa8417b05f8b6f2aa04018e4')
makedepends=('make' 'gcc' 'boost')
build() {
  cd "${srcdir}"/libmaus2-"${pkgver//_/-}"
  ./configure --prefix="${pkgdir}"/usr --exec-prefix "${pkgdir}"/
  make
}

check() {
  cd ${srcdir}/libmaus2-"${pkgver//_/-}"
  make test
}

package() {
  cd ${srcdir}/libmaus2-"${pkgver//_/-}"
  make install
  mv "${pkgdir}"/lib "${pkgdir}"/usr/lib
  install -Dm644 AUTHORS "${pkgdir}"/usr/share/licenses/"${pkgname}"2/AUTHORS
}
