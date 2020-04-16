_gitname=libbtbb
pkgname=libbtbb-git
pkgver=2018.12.R1.r3.g6c7b9ff
pkgrel=1
pkgdesc='Bluetooth baseband decoding library'
url='https://github.com/greatscottgadgets/libbtbb'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(cmake)
depends=('python' 'git')
source=("git+https://github.com/greatscottgadgets/libbtbb.git")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${_gitname}/"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/build/"
  make install
}

pkgver() {
  cd "${srcdir}/${_gitname}/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
