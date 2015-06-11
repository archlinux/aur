# Maintainer: Frikilinux <frikilinux at gmail.com

pkgname=klog
pkgver=0.6.2
pkgrel=1
pkgdesc="Ham radio logging"
url="http://jaime.robles.es/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('kdebase-runtime' 'hamlib')
makedepends=('automoc4' 'cmake')
conflicts=()
source="http://download-mirror.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
sha256sums=('536203e98614a2ad7e0469bedd8bf07245eb93326381f11a1ec4a0cf039468e0')

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    cmake  -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_BUILD_TYPE=RELEASE                                                       
}
package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

