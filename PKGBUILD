# Maintainer: Christopher Loen <christopherloen at gmail dot com>

pkgname='bluto'
pkgver='1.1.20'
pkgrel=1
pkgdesc='Recon, Subdomain Bruting, Zone Transfers'
arch=('any')
url='https://github.com/RandomStorm/Bluto'
license=('GPL3')
depends=('python2-pip')
source=('https://github.com/RandomStorm/Bluto/archive/master.zip')
md5sums=('8740193b31086bdf7e75a4a5bc27e4be')
prepare() {
        cd "${srcdir}/Bluto-master"
        cd Bluto
        sed -i 1d bluto
        sed -i '1 i\#!/usr/bin/python2' bluto
}
package() {
        cd "${srcdir}/Bluto-master"
        pip2 install --isolated --root="${pkgdir}" --no-deps --ignore-installed .
        install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
        cp LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
