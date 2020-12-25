# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe <ndowens.aur at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=amberfish
pkgver=2.3.0
pkgrel=1
pkgdesc="A general purpose text retrieval software"
arch=('i686' 'x86_64')
url="https://github.com/nassibnassar/amberfish"
license=('GPL2')
depends=('xerces-c')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nassibnassar/amberfish/archive/v${pkgver}.tar.gz")
sha256sums=('6a0cfbde1225e3e983be1dca79a61deb19a93aa43a544bd3c5128bad0190fc0c')

build() {
  cd ${pkgname}-${pkgver}
  autoconf
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              LDFLAGS=''
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
