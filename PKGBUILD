# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
pkgname=easytax-ag-2019
pkgver=1.3
pkgrel=1
pkgdesc='Proprietary tax software'
arch=('x86_64')
url='https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp'
license=('unknown')
depends=('jre8-openjdk')
source=("$pkgname-$pkgver.tar.gz::https://msg-easytax.ch/ag/2019/EasyTax2019AG_unix_1_3.tar.gz")
sha256sums=('3529ff933fed340a88436c6d2356fb495389e0606c7b6e22459c2b6e0cbd0b8d')

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/EasyTax2019AG" "${pkgdir}/opt/${pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "${pkgdir}/opt/${pkgname}/EasyTax2019_AG" "${pkgdir}/usr/bin/${pkgname}"
}

