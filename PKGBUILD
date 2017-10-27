# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <archange@archlinux.org>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-thermal-monitor
pkgver=1.2.8
pkgrel=1
pkgdesc="Plasma applet for monitoring temperatures of existing sensors including CPU, GPU and HDD."
arch=('any')
url="https://github.com/kotelnik/plasma-applet-thermal-monitor"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('extra-cmake-modules')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a7ab7d4eb7aed93b5892027513a4a6f99b8b5a983ebbeeeac00e02d43b55dba8')

prepare() {
    mkdir -p build
}

build() {
    cd build

    cmake ../plasma-applet-thermal-monitor-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install
}
