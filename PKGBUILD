# Maintainer: zandemax <zandemax@zmnet.de>
# Contributor: 3yan <zelenkaj@vscht.cz>
# Contributor: Pinky <j-pi@seznam.cz>

pkgname=mestrenova
pkgver=14.3.1
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' 'openssl-1.0')
source=("https://mestrelab.com/downloads/mnova/linux/Ubuntu/20.04/mestrenova_14.3.1-31739_amd64.deb")
sha256sums=('8fd4744fedf8bcc3be8c5611f517ae6acc50405b571f4b7c3596bc19d4eb709d')

options=(!strip) 

package() {
    tar -xf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/share/license/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}

