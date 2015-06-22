# Maintainer: 

pkgname=whdd
pkgver=2.2
pkgrel=1
pkgdesc="Diagnostic and recovery tool for block devices (near to replace MHDD for Linux)"
arch=('i686' 'x86_64')
url="http://whdd.org"
license=('GPL')
depends=('ncurses' 'smartmontools' 'dialog')
makedepends=('cmake')
source=(http://github.com/krieger-od/${pkgname}/tarball/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4c121c35f242e7770bda12b46dc47192')

build() {
  mv krieger-od-${pkgname}-* ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}


  cmake .
  make
}

package() {
  cd ${pkgname}-${pkgver}

  # make install DESTDIR="${pkgdir}"/usr/bin/
  install -D -m 755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"

}
