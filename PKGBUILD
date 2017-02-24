# Maintainer: 

pkgname=whdd
pkgver=3.0
pkgrel=1
pkgdesc="Diagnostic and recovery tool for block devices (near to replace MHDD for Linux)"
arch=('i686' 'x86_64')
url="https://github.com/whdd/whdd"
license=('GPL')
depends=('ncurses' 'smartmontools' 'dialog')
makedepends=('cmake')
source=(https://github.com/whdd/whdd/archive/${pkgver}.tar.gz)
md5sums=('f8a52f3be562d8210c2f33ad098b7b31')

build() {
  cd ${pkgname}-${pkgver}

  # cmake .
  make
}

package() {
  cd ${pkgname}-${pkgver}

  # make install DESTDIR="${pkgdir}"/usr/bin/
  install -D -m 755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
}


