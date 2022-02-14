# Maintainer: Lucas Declercq <lucas dot declercq at mailbox dot org>

pkgname="conduktor"
pkgver=2.20.5
pkgrel=1
pkgdesc="A Kafka Desktop Client"
url="https://www.conduktor.io"
license=("Commercial")
arch=("any")
depends=("bash")
optdepends=("java-runtime>=11: at least Java 11")
source=("https://github.com/conduktor/builds/releases/download/v${pkgver}/Conduktor-linux-${pkgver}.zip"
        "conduktor.desktop")
options=("!strip")
sha256sums=('ffcab02d716ceb3b1fee0bf0ef9c1416401eb46916f438b4305063aa51221f2f'
            'a231b74a710988b04eda2e50917745da755ff04fe5a0898fe534351af9aa04c1')
package(){
    install -Dm755 -t "${pkgdir}/opt/${pkgname}/bin/" "${srcdir}/conduktor-${pkgver}/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/opt/${pkgname}/lib/" "${srcdir}/conduktor-${pkgver}"/lib/*.jar
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/"*.desktop

    mkdir -p "${pkgdir}/usr/bin"

    ln -s "/opt/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
