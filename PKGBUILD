# Maintainer: gilcu3
# Contributor: gilcu3

_pkgname=flatter
pkgname=${_pkgname}-git
pkgver=0.1
pkgrel=1
pkgdesc="flatter is a library for performing (f)ast (lat)tice (r)eduction of integer lattice bases"
arch=('x86_64')
url='https://github.com/keeganryan/flatter'
license=('GPL3')
depends=('eigen' 'gmp' 'fplll' 'gcc-libs' 'mpfr' 'glibc' 'lapack' 'openmp')
optdepends=('intel-oneapi-mkl')
makedepends=('git' 'cmake')
source=("git+$url.git")
sha256sums=('SKIP')


build() {
  cmake -B build -S "$_pkgname" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr'  -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake  --install build
}
