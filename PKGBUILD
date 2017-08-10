_gitname=ubertooth
pkgname=ubertooth-git
pkgver=2017.03.R2
epoch=2
pkgrel=1
pkgdesc="an open source wireless development platform suitable for Bluetooth experimentation"
url="https://github.com/greatscottgadgets/ubertooth"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libbtbb-git' 'libusbx' 'libpcap' 'python')
source=("https://github.com/greatscottgadgets/ubertooth/archive/master.zip")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_gitname}-master/host/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${_gitname}-master/host/build/"
  make install
}
