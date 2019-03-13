pkgname=sbpl
pkgver=1.3.1
pkgrel=1
pkgdesc="Lattice  Planner based on A* for mobile robotics."
arch=('i686' 'x86_64' 'armv7h')
url="http://sbpl.net/"
license=('BSD')
#depends=('')
makedepends=('cmake' 'git')
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/sbpl/sbpl.git")
md5sums=('SKIP')

build() {
  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ${srcdir}/$pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="-fpermissive"
  make 
}

package() {
   cd "${srcdir}/build"
   make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
