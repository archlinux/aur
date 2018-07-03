# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libquickmail
pkgver=0.1.28
pkgrel=1
pkgdesc="A library intended to give C/C++ developers a quick and easy way to send email from their applications"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libquickmail"
license=('GPL3')
source=("${pkgname}.tar.xz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz/download")
sha256sums=('45ac1e6fa28da33e28beefc5bf4cbd9e6311880997a7f2ae04fd49130eba3040')


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
