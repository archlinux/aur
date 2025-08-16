# Maintainer: Yuma Nur Alfath <yuma@yumana.my.id>
pkgname=oplpctools
pkgver=3.1
pkgrel=1
pkgdesc="Graphical PC tools for Open PS2 Loader (OPL)"
arch=('x86_64')
url="https://github.com/brainstream/OPL-PC-Tools"
license=('GPL3')
depends=('qt6-base' 'qt6-tools') # ganti ke qt5-base/qt5-tools kalau build gagal
makedepends=('cmake' 'gcc' 'make')
source=("git+https://github.com/brainstream/OPL-PC-Tools.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/oplpctools"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
}

package() {
  cd "$srcdir/oplpctools/build"
  make DESTDIR="$pkgdir" install
}
