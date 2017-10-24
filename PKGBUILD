# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libquickmail
pkgver=0.1.25
pkgrel=1
pkgdesc="A library intended to give C/C++ developers a quick and easy way to send email from their applications"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libquickmail"
license=('GPL3')
source=("${pkgname}.tar.xz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz/download")
sha256sums=('63ef088bd1cc6b01f2b16744f940cb157ec6cb41d173a5db57a7f031fdf36732')


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
