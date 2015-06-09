# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: t3ddy  <t3ddy1988 at gmail dot com>
# Contributor: Alex Kir <alex at wall-dev dot org>

pkgname=kdeplasma-applets-redshift
_name=redshift-plasmoid
pkgver=1.0
pkgrel=1
pkgdesc="Provides a configuration interface and a switch to start/stop Redshift daemon."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Redshift+plasmoid?content=148737"
license=('GPL3')
depends=('kdebase-workspace' 'redshift')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=(http://kde-apps.org/CONTENT/content-files/148737-${_name}-${pkgver}.tar.bz2)
md5sums=('20477cbcdbfde96dcf3092e9fe326b41')

build() {
  cd "$srcdir/${_name}-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make
}
package(){
  cd "$srcdir/${_name}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
