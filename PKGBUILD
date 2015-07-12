# Maintainer: Manish Munikar <munikarmanish at gmail dot com>

pkgname=8085-simulator
pkgver=2.0
pkgrel=2
pkgdesc="Jubin's 8085 Simulator with Trainer Kit, written in Java"
arch=('any')
url="https://8085simulator.codeplex.com"
license=('GPL2')
depends=('java-runtime')
install=
changelog=
source=("${pkgname}-${pkgver}.jar::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=8085simulator&DownloadId=87364&FileTime=130460912818130000&Build=21028"
        "${pkgname}"
        "${pkgname}.desktop")
noextract=("8085-simulator-2.0.jar")
sha256sums=("9ca0323f74e9cf5db13476a65c563bcf52ebf13dceb92a1f472b6d35bf7dd01e"
            "3f0a6856e16655e53ef70780a73fdfa516db2dc1c5be5727e3477087f5d77f32"
            "596e4a94073169a2d5e10f2dee9109a9646f64172b5af258beafe043ad273e76")

package() {
    msg2 "Copying source files..."
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.jar"

    msg2 "Creating executable file..."
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    msg2 "Creating desktop entry..."
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
