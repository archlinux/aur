# Author: Javier Tiá <javier dot tia at gmail dot com>

pkgname=complexity
pkgver=1.5
pkgrel=1
pkgdesc="Measure complexity of C source"
url="http://www.gnu.org/software/complexity/"
license=('GPL')
depends=('autogen')
makedepends=('autoconf' 'automake' 'gcc')
arch=('i686' 'x86_64')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1f5194c0dc6e813ea1dc7f36bfd05f15786a8ad6e9b3ab65b53d2263a0d93102')

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
