# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
pkgname=easytax-ag-2020
pkgver=1.2
pkgrel=1
pkgdesc='Proprietary tax software'
arch=('x86_64')
url='https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp'
license=('unknown')
depends=('jre8-openjdk')
source=("$pkgname-$pkgver.tar.gz::https://msg-easytax.ch/ag/2020/EasyTax2020AG_unix_1_2.tar.gz")
sha256sums=('1f8360510567e04a1f993fa9175dfbb3ef3358edc3aced67351ee0f88223c761')

package() {
    mkdir -p "${pkgdir}/opt"
    mv "${srcdir}/EasyTax2020AG" "${pkgdir}/opt/${pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "${pkgdir}/opt/${pkgname}/EasyTax2020_AG" "${pkgdir}/usr/bin/${pkgname}"
}

