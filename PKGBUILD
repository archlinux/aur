# Maintainer: zandemax <zandemax@zmnet.de>
# Contributor: 3yan <zelenkaj@vscht.cz>
# Contributor: Pinky <j-pi@seznam.cz>

pkgname=mestrenova
pkgver=14.2.2
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('x86_64')
url="https://www.mestrelab.com"
install=mestrenova.install
license=('custom:mestrelab')
depends=('libxi' 'glu' 'openssl-1.0')
source=("https://mestrelab.com/downloads/mnova/linux/Ubuntu/20.04/mestrenova_14.2.2-28739_amd64.deb")
sha256sums=('31a46a14fba04ddb44ca1788c80285e238133708554cb7e77ec79c37748267fc')

options=(!strip) 

package() {
    tar -xf data.tar.gz
    cp -R opt ${pkgdir}/opt

    install -D -m0644 ${pkgdir}/opt/MestReNova/share/license/license.txt "${pkgdir}/usr/share/licenses/mestrenova/LICENSE"
}

