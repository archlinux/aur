# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=klog
pkgver=0.9.2.3
pkgrel=1
pkgdesc="Ham radio logging"
url="http://jaime.robles.es/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('kdebase-runtime' 'hamlib')
makedepends=('automoc4' 'cmake')
conflicts=()
source=("http://download-mirror.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('992973b15270782e92d5aa4e42d966ed240ff3f44dba49bb3274ae6d4ae67cb6')

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    qmake-qt5 PREFIX=/usr klog.pro
#    cmake  -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_BUILD_TYPE=RELEASE                                                       
    make
}
package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    mkdir -p "${pkgdir}/usr/bin"
    install -m 755 klog "${pkgdir}/usr/bin" 
}

