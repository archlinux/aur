# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=nmapsi4
pkgver=0.6.alpha1
_pkgver=0.6-alpha1
pkgrel=1
pkgdesc="Qt6-based Gui for nmap"
arch=('i686' 'x86_64')
url="https://github.com/nmapsi4/nmapsi4"
license=('GPL2')
depends=('nmap>=6.00' 'bind-tools' 'qt6-webengine')
makedepends=('cmake>=3.16.0' 'qt6-tools>=6.4.0')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
md5sums=('6cc73487810c975d3a173539956904c8')

build() {
    cd "${srcdir}/${pkgname}-${_pkgver}/tools"
    ./cmake_verbose_script.sh
}

package() {
    cd "${srcdir}/${pkgname}-${_pkgver}/build"
    make DESTDIR=${pkgdir} install

    # Fix executable permisions
    chmod 755 ${pkgdir}/usr/bin/*
}


