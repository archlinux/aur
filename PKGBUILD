# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmixer
pkgver=1.5
pkgrel=1
pkgdesc="A mixer application written for the WindowMaker dock."
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/101"
license=('GPL')
source=("http://linux-bsd-unix.strefa.pl/${pkgname}-${pkgver}.tar.gz" "wmmixer.patch")
source=("${pkgname}-${pkgver}.tar.gz" "wmmixer.patch")
md5sums=('bfb1ded801910dd39e1bb0b273c4e1c3'
         '2b79b2be0ae022b0dd68ea966b28e65b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix=/usr
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix=/usr DESTDIR="$pkgdir" install
}
