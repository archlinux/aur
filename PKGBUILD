pkgname=kismet-plugin-ubertooth
pkgver=2018.08.R1
pkgrel=1
pkgdesc="Ubertooth plugin for Kismet"
url="http://sourceforge.net/projects/ubertooth/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('ubertooth' 'kismet')
source=("https://github.com/greatscottgadgets/ubertooth/releases/download/2018-08-R1/ubertooth-2018-08-R1.tar.xz"
        "https://www.kismetwireless.net/code/kismet-2016-07-R1.tar.xz")
md5sums=('41a5c192c1f0b5df0516f4abd08ac995'
         '7fa6e86c5078a0e7d91fc9bf954c5107')

build() {
  cd "${srcdir}/kismet-2016-07-R1"
  ./configure prefix="${pkgdir}/usr"
  cd "${srcdir}/ubertooth-2018-08-R1/host/kismet/plugin-ubertooth"
  KIS_SRC_DIR="${srcdir}/kismet-2016-07-R1" UBERTOOTH_INC_DIR="${srcdir}/ubertooth-2018-08-R1/host/libubertooth/src" make
}

package() {
  cd "${srcdir}/ubertooth-2018-08-R1/host/kismet/plugin-ubertooth"
  KIS_SRC_DIR="${srcdir}/kismet-2016-07-R1" UBERTOOTH_INC_DIR="${srcdir}/ubertooth-2018-08-R1/host/libubertooth/src" make install
}
