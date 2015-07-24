# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=xmlrpc-epi
pkgver=0.54.2
pkgrel=1
pkgdesc="An implementation of the xmlrpc protocol in C"
arch=('i686' 'x86_64')
url="http://xmlrpc-epi.sourceforge.net/"
license=('MIT')
depends=('expat')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-base/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('081e605491429cda17c5f021f211b8fd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR=${pkgdir}
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
