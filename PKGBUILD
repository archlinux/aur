_gitname=libbtbb
pkgname=libbtbb-git
pkgver=2017.03.R2
pkgrel=1
pkgdesc='Bluetooth baseband decoding library'
url='https://github.com/greatscottgadgets/libbtbb'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(cmake)
depends=('python')
source=("https://github.com/greatscottgadgets/libbtbb/archive/master.zip")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${_gitname}-master/"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${_gitname}-master/build/"
  make install
}
