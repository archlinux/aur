# Maintainer: Jerome Lebleu <jerome dot lebleu at mailoo dot org>

pkgname=qlcplus-qt5
_pkgname=qlcplus
pkgver=4.10.4
pkgrel=1
pkgdesc="Q Light Controller Plus - The open DMX lighting desk software for controlling professional lighting fixtures."
arch=('i686' 'x86_64')
url="http://qlcplus.org/"
license=('APACHE')
depends=('qt5-script' 'qt5-multimedia' 'libftdi-compat' 'libsndfile' 'libmad' 'shared-mime-info' 'fftw')
# ola need to be installed at build time for the plugin to be compiled
optdepends=('ola: Open Lighting Architecture plugin')
provides=("$_pkgname=$pkgver")
conflicts=('qlcplus' 'qlc' 'qlc-svn')
install=${_pkgname}.install
source=("http://www.qlcplus.org/downloads/${pkgver}/qlcplus_${pkgver}.tar.gz")
md5sums=('049ff5907e2fb6cdc492aedaf8f6b078')

build() {
  cd "${srcdir}/qlcplus-${pkgver}"
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/qlcplus-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
}
