# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>

pkgname=simulide
pkgver=0.2.8.SR1
pkgver_base="0.2.8"
pkgver_dash="0.2.8-SR1"
pkgrel=1
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)"
arch=('x86_64')
url="http://simulide.blogspot.com/"
license=('GPL3')
source=("https://sourceforge.net/projects/${pkgname}/files/SimulIDE_${pkgver_base}/SimulIDE_${pkgver_dash}-Sources.tar.gz")
md5sums=('f7c360c5fdac7a694022602c06937cba')
depends=(
'gpsim'
'qt5-multimedia'
'qt5-serialport'
'qt5-svg'
)

build() {
  cd ${srcdir}/${pkgname}_${pkgver_base}/build_XX
  qmake
  make
}

package() {
  cp -r ${srcdir}/${pkgname}_${pkgver_base}/build_XX/release/SimulIDE_${pkgver_base} ${pkgdir}/usr
  ln -s SimulIDE_${pkgver_base} ${pkgdir}/usr/bin/simulide
}
