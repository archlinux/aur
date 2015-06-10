# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=asl
pkgver=0.1.2
pkgrel=1
pkgdesc='Multiphysics simulation software package (Advanced Simulation Library)'
arch=('i686' 'x86_64')
url='http://asl.org.il/'
license=('AGPL3')
depends=('vtk' 'libcl' 'boost')
makedepends=('cmake' 'opencl-headers')
optdepends=('libmatio: Matlab file format support (should be installed before build)')
conflicts=('asl-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AvtechScientific/ASL/archive/v${pkgver}.tar.gz")
sha256sums=('bdbd4a6027fa514d921019fd0572418d064106ce5be1d952b47afba18b5d448c')

build() {
  cd "$srcdir/ASL-$pkgver"
  mkdir build && cd build
  cmake -G "Unix Makefiles" ../
  make
}

package() {
  cd "$srcdir/ASL-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
