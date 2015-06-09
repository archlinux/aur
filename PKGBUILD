# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

pkgname=interceptty
pkgver=0.6
pkgrel=2
pkgdesc="A serial port sniffer, network serial server/client and serial port emulator."
arch=('i686' 'x86_64')
url="http://www.suspectclass.com/sgifford/interceptty/"
license=('GPL')
depends=('perl')
source=("http://www.suspectclass.com/sgifford/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('915244f09601e3c71209e444f2d3194f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install
}
