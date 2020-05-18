# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>
pkgname=fontobene-qt5
pkgver=0.1.0
pkgrel=1
pkgdesc="FontoBene font parser library for C++ / Qt5"
arch=('any')
url="https://github.com/fontobene/fontobene-qt5/"
license=('Apache')
depends=()  # Note: Dependent packages will need qt5-base
makedepends=('qt5-base')
source=("https://github.com/fontobene/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e40e56698e8415024834fb5bef5393fd625f81f5a8e84cad742a9264a70513e5')

build() {
  # Note: We're only using qmake/make here to install the header files.
  #       There is no actual compilation going on (the library is header-only).
  cd "$srcdir/"
  rm -rf build
  mkdir build && cd build
  qmake ../$pkgname-$pkgver/fontobene-qt5/fontobene-qt5.pro PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "$srcdir/build"
  make install
}

# vim:set ts=2 sw=2 et:
