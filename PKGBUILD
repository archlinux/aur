# Maintainer: (XavierCLL) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=ksvnupdater
pkgver=2.1.3
pkgrel=1
pkgdesc="ksvnupdater is a utility oriented KDE translation teams. Through it you can have various local copies of repository, generating projects for Lokalize, checks and corrections using Pology and more."
url="http://www.eloihr.net/ksvnupdater"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kfilemetadata' 'kio' 'knotifications' 'kitemviews' 'kiconthemes' 'karchive' 'qt5-base')
makedepends=('extra-cmake-modules' 'kdoctools')
optdepends=('lokalize' 'pology' 'kdiff3' 'gettext' 'openssh' 'which')
source=(http://www.eloihr.net/ksvnupdater/files/ksvnupdater-$pkgver.tar.bz2)
md5sums=('b8a821a91bb09dedac9b409f7e217d03')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make clean 
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}
