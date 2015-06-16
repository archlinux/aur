# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libquickmail
pkgver=0.1.19
pkgrel=3
pkgdesc="A library intended to give C/C++ developers a quick and easy way to send email from their applications"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libquickmail"
license=('GPL3')
source=("${pkgname}.tar.xz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz/download")
sha256sums=('9c54e9a0b9dee5b51c4c410f822766bd44c87aa6e20091c8ee5d270eec242f00')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$(readlink -f ${pkgdir})/" install
}
