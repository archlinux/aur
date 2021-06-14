# Maintainer: zoe <chp321 [at] gmail [dot] com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=nmapsi4
pkgver=0.5.alpha2
_pkgver=0.5-alpha2
pkgrel=1
pkgdesc="Qt5-based Gui for nmap"
arch=('i686' 'x86_64')
url="https://github.com/nmapsi4/nmapsi4"
license=('GPL2')
depends=('nmap>=6.00' 'bind-tools')
makedepends=('cmake>=2.8.2' 'qt5-webkit>=5.7')
source=("https://iweb.dl.sourceforge.net/project/nmapsi/${pkgname}-0.5/${pkgname}-${_pkgver}.tar.xz")
md5sums=('b098a4793d5b715b6650a19bbae9eeae')

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


