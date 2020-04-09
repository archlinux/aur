# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=qmpdclient-qt5
pkgver=2.0.1
pkgrel=3
pkgdesc='A Qt5 client for MPD'
arch=('x86_64')
license=('GPL2')
url='https://github.com/ChaoticEnigma/qmpdclient'
_archive="v${pkgver}.tar.gz"
source=("https://github.com/ChaoticEnigma/qmpdclient/archive/${_archive}")
sha256sums=('3b09622dcf2c7b31c25ca9caf6db4a701ba79e7786d8b4d76908239df8655e15')
depends=('qt5-base' 'qt5-xmlpatterns' 'qt5-x11extras' 'dbus')
conflicts=('qmpdclient')

prepare() {
    tar -xf ${_archive}
    cd qmpdclient-${pkgver}
    mkdir -p build
}

build() {
    cd qmpdclient-${pkgver}/build
    cmake ..
    cmake --build .
}

package() {
    cd qmpdclient-${pkgver}/build
    cmake --install . --prefix $pkgdir/usr
}

