# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
pkgname=easytax-ag-2020
pkgver=1.3
pkgrel=1
pkgdesc='Proprietary tax software'
arch=('x86_64')
url='https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp'
license=('unknown')
depends=('jre8-openjdk')
source=("$pkgname-$pkgver.tar.gz::https://msg-easytax.ch/ag/2020/EasyTax2020AG_unix_1_3.tar.gz")
sha256sums=('23b5789ac772c1551b95d6db5ee8f143c7dced9e4a00b701740db6f3a6837abd')

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/EasyTax2020AG" "${pkgdir}/opt/${pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "${pkgdir}/opt/${pkgname}/EasyTax2020_AG" "${pkgdir}/usr/bin/${pkgname}"
}

