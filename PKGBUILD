# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libquickmail
pkgver=0.1.22
pkgrel=1
pkgdesc="A library intended to give C/C++ developers a quick and easy way to send email from their applications"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libquickmail"
license=('GPL3')
source=("${pkgname}.tar.xz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz/download")
sha256sums=('96e416d29a4866027148ac83be7bcb8178d24263003287f0b8e3396444534f29')

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
