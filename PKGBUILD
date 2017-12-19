# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=libmaus
pkgver=2.0.433
pkgrel=1
release=20171218125839
pkgdesc="Bioinformatics data structures and algorithms in C++"
arch=('x86_64')
url="https://github.com/gt1/libmaus2"
license=('GPL3')
depends=()
makedepends=('gcc-libs')
provides=('libmaus')
conflicts=('libmaus')
source=("https://github.com/gt1/${pkgname}2/archive/${pkgver}-release-${release}.tar.gz")
md5sums=('7ab7575a60d43ca5660019b37958b8a3')
MAKEFLAGS="-j$(nproc)"

build() {
  cd "${srcdir}/libmaus2-${pkgver}-release-${release}"
  ./configure --prefix="${pkgdir}/usr/local" --exec-prefix "${pkgdir}/"
  make
}

check() {
  cd "${srcdir}/libmaus2-${pkgver}-release-${release}"
  make test
}

package() {
  cd "${srcdir}/libmaus2-${pkgver}-release-${release}"
  make install

  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
}
