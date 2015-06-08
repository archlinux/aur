# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duff
pkgver=0.5.2
pkgrel=1
pkgdesc="A command-line utility for quickly finding duplicates in a given set of files"
arch=('i686' 'x86_64')
url="http://duff.sourceforge.net/"
license=('custom')
depends=('glibc' 'sh')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('483f9216ebea14b090e0d71dbf7077ff')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
