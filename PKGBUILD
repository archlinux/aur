# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=nmapsi4
pkgver=0.5.alpha1
_pkgver=0.5-alpha1
pkgrel=1
pkgdesc="Qt5-based Gui for nmap"
arch=('i686' 'x86_64')
url="http://www.nmapsi4.org/"
license=('GPL2')
depends=('nmap>=6.00' 'bind-tools')
makedepends=('cmake>=2.8.2' 'qt5-webkit>=5.2')
source=(http://sourceforge.net/projects/nmapsi/files/${pkgname}-0.5/${pkgname}-${_pkgver}.tar.xz)
sha1sums=('b2e69e50c4deefb983cca10934d660cbe290e4fd')

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


