# Maintainer: 

pkgname=whdd
pkgver=3.0.1
pkgrel=1
pkgdesc="Diagnostic and recovery tool for block devices (near to replace MHDD for Linux)"
arch=('i686' 'x86_64')
url="https://github.com/whdd/whdd"
license=('GPL3')
depends=('ncurses' 'dialog')
optdepends=('smartmontools: for reading SMART attributes')
# makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/whdd/whdd/archive/${pkgver}.tar.gz")
sha512sums=('6d5d8dad7537118a5915a29a549e18595da1b6ba031f0ca661805ad0033fd48f32804eb307f67e7b31d6002e708ae578a32aff366f3e610ab36b25f0a4e50803')

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

