# Maintainer: zandemax <zandemax@zmnet.de>
# Contributor: 3yan <zelenkaj@vscht.cz>
# Contributor: Pinky <j-pi@seznam.cz>

pkgname=mestrenova
pkgver=14.2.3
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' 'openssl-1.0')
source=("https://mestrelab.com/downloads/mnova/linux/Ubuntu/20.04/mestrenova_14.2.3-29241_amd64.deb")
sha256sums=('8be8d92692288cb254e31af39a2c6a08506dd02a1775e13db2ba87a0d3d25dd4')

options=(!strip) 

package() {
    tar -xf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/share/license/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}

