# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Antonio Rojas <arojas (at) archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry (at) archlinux.org>
# Contributor: Felix Yan <felixonmars (at) archlinux.org>
# Contributor: Andrea Scarpino <andrea (at) archlinux.org>
# Contributor: trya <tryagainprod (at) gmail.com>

pkgname=quazip-legacy
pkgver=0.9.1
pkgrel=1
pkgdesc="Legacy ersion of quazip-qt5"
url="https://stachenov.github.io/quazip/"
license=(LGPL)
arch=(x86_64)
depends=(qt5-base)
makedepends=(cmake)
source=(https://github.com/stachenov/$_pkgname/archive/v$pkgver.tar.gz)
sha256sums=('5d36b745cb94da440432690050e6db45b99b477cfe9bc3b82fd1a9d36fff95f5')

package() {
  mkdir -p build
  cd build
  cmake ../$_pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
  make DESTDIR="$pkgdir" install
}

#package() {
#mkdir -p "${pkgdir}"/usr/{include,lib/{cmake,pkgconfig}}
#ln -sv /usr/include/QuaZip-Qt5-1.5 "${pkgdir}"/usr/include/quazip5
#ln -sv /usr/lib/cmake/QuaZip-Qt5-1.5 "${pkgdir}"/usr/lib/cmake/QuaZip5
#ln -sv /usr/lib/pkgconfig/quazip1-qt5.pc "${pkgdir}"/usr/lib/pkgconfig/quazip.pc
#for e in "" .1 .1.0.0 
# do ln -sv /usr/lib/libquazip1-qt5.so "${pkgdir}"/usr/lib/libquazip5.so${e}
#done
#}
