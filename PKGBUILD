# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=morris
pkgver=0.2
pkgrel=3
pkgdesc="An implementation of the board game Nine Men's Morris"
arch=('i686' 'x86_64')
url="http://nine-mens-morris.net/"
license=('GPL3')
depends=('gtk2' 'gconf' 'boost-libs')
makedepends=('intltool' 'boost')
source=("http://www.nine-mens-morris.net/data/${pkgname}-${pkgver}.tar.bz2")
md5sums=('3baa1684810f3f1990a8af10b48a96f8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "AUTHORS" "README" "${pkgdir}/usr/share/doc/${pkgname}"
}
