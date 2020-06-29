# Maintainer: zandemax <zandemax@zmnet.de>
# Contributor: 3yan <zelenkaj@vscht.cz>
# Contributor: Pinky <j-pi@seznam.cz>

pkgname=mestrenova
pkgver=14.1.2
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' 'openssl-1.0')
source=("https://mestrelab.com/downloads/mnova/linux/Ubuntu/16.04/mestrenova_14.1.2-25024_amd64.deb")
sha256sums=('6368660fb0d4ec498c2c04462206bc048741652ba65423201c0ed43237b6ffb4')

options=(!strip) 

package() {
    tar -xvf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/share/license/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}

