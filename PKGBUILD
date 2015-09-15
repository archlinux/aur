pkgname=ubertooth
pkgver=2015.09.R2
pkgrel=1
pkgdesc="A 2.4 GHz wireless development board suitable for Bluetooth experimentation. Open source hardware and software. Tools only"
url="http://sourceforge.net/projects/ubertooth/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libusbx' 'libbtbb' 'libpcap' 'python')
source=("https://github.com/greatscottgadgets/ubertooth/releases/download/2015-09-R2/ubertooth-2015-09-R2.tar.xz")
md5sums=('81e5701a35dd12afe68c50c0ab248d76')

build() {
  cd "${srcdir}/${pkgname}-2015-09-R2/host/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-2015-09-R2/host/build/"
  make install
}

