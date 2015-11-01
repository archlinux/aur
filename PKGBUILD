pkgname=ubertooth
pkgver=2015.10.R1
pkgrel=1
pkgdesc="A 2.4 GHz wireless development board suitable for Bluetooth experimentation. Open source hardware and software. Tools only"
url="http://sourceforge.net/projects/ubertooth/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libbtbb' 'libusbx' 'libpcap' 'python')
source=("https://github.com/greatscottgadgets/ubertooth/releases/download/2015-10-R1/ubertooth-2015-10-R1.tar.xz")
md5sums=('9d08c87c34c48a4af116e260bd9d12c0')

build() {
  cd "${srcdir}/${pkgname}-2015-10-R1/host/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-2015-10-R1/host/build/"
  make install
}

