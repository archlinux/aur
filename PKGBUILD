# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=ksvnupdater
pkgver=1.4.0
pkgrel=1
pkgdesc="ksvnupdater is a utility oriented KDE translation teams. Through it you can have various local copies of repository, generating projects for Lokalize, checks and corrections using Pology and more."
url="http://www.eloihr.net/ksvnupdater"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-runtime' 'pology')
makedepends=('cmake' 'automoc4' 'docbook-xsl')
install=${pkgname}.install
source=(http://www.eloihr.net/ksvnupdater/files/ksvnupdater-$pkgver.tar.bz2)
md5sums=('430d498645dca2fd77fafed29e4c9ac8')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake4 ..
  make clean 
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}
