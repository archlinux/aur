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
source=("https://github.com/greatscottgadgets/libbtbb/archive/2017-03-R2.tar.gz")
sha1sums=('76d063471c41de24f071700238badbebcc20ee5f')

build() {
  cd "${srcdir}/${_gitname}-2017-03-R2/"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${_gitname}-2017-03-R2/build/"
  make install
}
