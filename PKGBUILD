# Maintainer: zandemax <zandemax@zmnet.de>
# Contributor: 3yan <zelenkaj@vscht.cz>
# Contributor: Pinky <j-pi@seznam.cz>

pkgname=mestrenova
pkgver=15.0.1
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' 'openssl-1.0')
source=("https://mestrelab.com/downloads/mnova/linux/Ubuntu/22.04/mestrenova_15.0.1-35756_amd64.deb")
sha256sums=('1a1de52a4d34e0da5cbe1892c0d856eb6d0802a872c43649d7edce7e6e21ebc8')

options=(!strip) 

package() {
    tar -xf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/share/license/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}

