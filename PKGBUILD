# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kdeplasma-applets-cpufrequtility
pkgver=1.6
pkgrel=2
pkgdesc="CPU Frequence Utility plasmoid"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/plasmaCpuFreqUtility?content=144809"
license=('GPL')
depends=('kdebase-workspace' 'kdebindings-python2')
makedepends=('cmake' 'automoc4')
conflicts=('kdeplasma-addons-applets-cpufrequtility')
replaces=('kdeplasma-addons-applets-cpufrequtility')
source=("http://kde-apps.org/CONTENT/content-files/144809-kde-plasma-cpufrequtility-${pkgver}.tar.bz2")
sha256sums=('9c2c57e2ec4e7b0a906f84c92e43415144bf97e3991e26c7a19bb7e582213e99')
 
build() {
  mkdir build
  cd build
  cmake ../kde-plasma-cpufrequtility-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
