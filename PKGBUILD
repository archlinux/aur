# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=configuradorfnmt
pkgver=5.0.3
pkgrel=2
pkgdesc="Tool for request keys and certificates of FNMT"
arch=('any')
url="https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves"
license=('LicenseRef-FNMT')
depends=('java-runtime>=22')
optdepends=('icedtea-web: If the certificate renewal does not work, install this')
options=('!debug' '!emptydirs')
source=("${pkgname}-${pkgver}-amd64.deb::https://descargas.cert.fnmt.es/Linux/configuradorfnmt_${pkgver}.amd64.deb"
        "${pkgname}.desktop"
        "${pkgname}")
noextract=("${pkgname}-${pkgver}-amd64.deb")
b2sums=('39adb59f0b64c84b10e75a2c3728fa5f509b169050c80a7c12e1b08753416eba99ba47ce64d02b6e7e2fba59b6c2e71374225db55fe68a027b7b9de561e97c5c'
        '668221fb76264ab2d77d1417fec8032a498d369e7f5005c713a3b9a5244f91afd203f7644c12b4f72984634ffac897e04b32bbaf3cf7626ef81743736b9a9db2'
        '6218b559d57d7baaee6fd4d98546dc0a93e91dc7931f06a6e8b7fe2cad076b499ade5c731c572f5e36377e1642179b6e867b891e99fb618b5d38bc0500127aef')

package() {
    bsdtar -O -xf "${pkgname}-${pkgver}"*.deb data.tar.xz | bsdtar -C "${srcdir}" -xJf -

    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "usr/lib/${pkgname}/bc-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bc-fips.jar"
    install -Dm644 "usr/lib/${pkgname}/bcutil-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bcutil-fips.jar"
    install -Dm644 "usr/lib/${pkgname}/bcpkix-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bcpkix-fips.jar"
    install -Dm644 "usr/share/doc/configuradorfnmt/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
