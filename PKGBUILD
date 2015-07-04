# Maintainer: Manish Munikar <munikarmanish at gmail dot com>

pkgname=8085-simulator
pkgver=2.0
pkgrel=1
pkgdesc="Jubin's 8085 Simulator with Training Kit, written in Java"
arch=('any')
url="https://8085simulator.codeplex.com"
license=('GPL2')
depends=('java-runtime')
install=
changelog=
source=("${pkgname}-${pkgver}.jar::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=8085simulator&DownloadId=87364&FileTime=130460912818130000&Build=21024"
        "${pkgname}"
        "${pkgname}.desktop")
noextract=("8085-simulator-2.0.jar")
sha256sums=("9ca0323f74e9cf5db13476a65c563bcf52ebf13dceb92a1f472b6d35bf7dd01e"
            "449c1dabed9d2a7e0689420a79975d6b6734842a91e4dfccfedbe223402ebd0a"
            "30385a84b5f6cebd78cc7e770ce74f2a9f6271e4000dfb676da0e36f7451c0be")

package() {
    msg2 "Copying source files..."
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.jar"

    msg2 "Creating executable file..."
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    msg2 "Creating desktop entry..."
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
