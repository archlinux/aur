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
sha256sums=('64618514df610cc71a3e1e5c81a06e94f6534dcc1bd869a8e6687b05ad8e3935')
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
