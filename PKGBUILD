# Contributor: Pablo Nicolas Diaz <pablonicolas.diaz at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dmake
pkgver=4.12.2
pkgrel=1
pkgdesc="A make utility similar to GNU make or the Workshop dmake, formerly used by the OpenOffice.org build system."
arch=('i686' 'x86_64')
license=('GPL')
url="http://tools.openoffice.org/dmake/index.html"
depends=('glibc')
source=(https://dmake.apache-extras.org.codespot.com/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('9194f727c31d1db18bf5dd02e7b2dd09')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure  --prefix=/usr --enable-spawn 
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

