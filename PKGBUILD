# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <archange@archlinux.org>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-thermal-monitor
pkgver=1.2.9
pkgrel=1
pkgdesc="Plasma applet for monitoring temperatures of existing sensors including CPU, GPU and HDD."
arch=('any')
url="https://github.com/kotelnik/plasma-applet-thermal-monitor"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('extra-cmake-modules')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b665025a4c22a33244b9c8bf87cdc26080715225a56ae46beefda4c8cad8520d')

prepare() {
    mkdir -p build
}

build() {
    cd build

    cmake ../plasma-applet-thermal-monitor-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install
}
