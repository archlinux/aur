# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libquickmail
pkgver=0.1.29
pkgrel=2
pkgdesc="A library intended to give C/C++ developers a quick and easy way to send email from their applications"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/libquickmail"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.xz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.xz/download")
sha256sums=('fb507087392ecd8b9a5f9f6e95af0e2bc8d547640bd1a32b0958b4b5cbf2e847')


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
