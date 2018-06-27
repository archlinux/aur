# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>

pkgname=simulide
pkgver=0.1.7
pkgrel=1
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)"
arch=('x86_64')
url="http://simulide.blogspot.com/"
license=('GPL3')
source=("https://sourceforge.net/projects/${pkgname}/files/SimulIDE_${pkgver}/${pkgname}_${pkgver}-Sources.tar.gz")
md5sums=('61c260374ae0e7733f867349b7990acf')
depends=(
'gpsim'
'qt5-multimedia'
'qt5-serialport'
'qt5-svg'
)

build() {
  cd ${srcdir}/${pkgname}_${pkgver}/build_XX
  qmake
  make
}

package() {
  cp -r ${srcdir}/${pkgname}_${pkgver}/build_XX/release/SimulIDE_${pkgver} ${pkgdir}/usr
  ln -s SimulIDE_${pkgver} ${pkgdir}/usr/bin/simulide
}
