# Author: Javier Tiá <javier dot tia at gmail dot com>

pkgname=complexity
pkgver=1.9
pkgrel=1
pkgdesc="Measure complexity of C source"
url="http://www.gnu.org/software/complexity/"
license=('GPL')
depends=('autogen')
makedepends=('autoconf' 'automake' 'gcc')
arch=('i686' 'x86_64')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('aa5fd44d2db2ea1d4e3aa323d0f6b7f35cb58898d50ca256138ec6b24b39d2a2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 ft=sh et:
