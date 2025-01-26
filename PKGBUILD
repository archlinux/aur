# Maintainer: 

pkgname=whdd
pkgver=3.1
pkgrel=1
pkgdesc="Diagnostic and recovery tool for block devices (near to replace MHDD for Linux)"
arch=('i686' 'x86_64')
url="https://github.com/whdd/whdd"
license=('GPL3')
depends=('ncurses' 'dialog')
optdepends=('smartmontools: for reading SMART attributes')
# makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/whdd/whdd/archive/${pkgver}.tar.gz")
sha512sums=('8960b482d7c3a75b0b9e540092a0c074dbb66561f455fdf454e8cd89cc5dc4dc028e60b44ce74ecbf568af5e7e34a5b3b5deaee9480112f4161d98b773442bed')

build() {
  cd ${pkgname}-${pkgver}

  # cmake .
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make install DESTDIR="${pkgdir}"/usr/
  # install -D -m 755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
}

