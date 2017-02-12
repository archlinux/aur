# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-redshift-control
pkgver=1.0.18
pkgrel=1
pkgdesc="Plasma applet for controlling redshift."
arch=('any')
url="https://github.com/kotelnik/plasma-applet-redshift-control"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'redshift')
makedepends=('extra-cmake-modules')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9f6de46653d9467e155ab857c84ef02021509f96afe0a4a7db9555f2a1da8d46')

prepare() {
    mkdir -p build
}

build() {
    cd build

    cmake ../plasma-applet-redshift-control-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install
}
