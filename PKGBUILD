# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=nmapsi4
pkgver=0.5.alpha2
_pkgver=0.5-alpha2
pkgrel=3
pkgdesc="Qt5-based Gui for nmap"
arch=('i686' 'x86_64')
url="https://github.com/nmapsi4/nmapsi4"
license=('GPL2')
depends=('nmap>=6.00' 'bind-tools' 'qt5-webengine')
makedepends=('cmake>=2.8.2' 'qt5-tools>=5.7')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
md5sums=('296843cc03147436fba210de30309b3c')

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


