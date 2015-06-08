# Contributor: Todd Partridge (Gen2ly) <toddrpartridge (at) gmail>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Tilo Brueckner  blueperil at gmx de

pkgname=kbackup
pkgver=0.8
pkgrel=2
pkgdesc="Backup program for KDE"
arch=('i686' 'x86_64')
url="http://members.aon.at/m.koller/"
license=('GPL')
depends=('kdelibs>=4.2')
makedepends=('automoc4' 'cmake' 'docbook-xml')
source=(http://members.aon.at/m.koller/$pkgname-$pkgver.tar.bz2)
md5sums=('77e18c0775ddc6fbf94a9f616e5cedec')


build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR=$pkgdir install || return 1
}
