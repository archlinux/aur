# Maintainer: Manish Munikar <munikarmanish at gmail dot com>
# Contributor: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>

pkgname=8085-simulator
pkgver=2.0
pkgrel=5
pkgdesc="Jubin's 8085 Simulator with Trainer Kit, written in Java"
arch=('any')
url="https://8085simulator.codeplex.com"
license=('GPL2')
depends=('java-runtime')
install=
changelog=
source=("http://mirror.jkanetwork.com/Third-Party/$pkgname-$pkgver.jar"
        "${pkgname}"
        "${pkgname}.desktop")
noextract=("8085-simulator-2.0.jar")
sha256sums=('9ca0323f74e9cf5db13476a65c563bcf52ebf13dceb92a1f472b6d35bf7dd01e'
            '5ee001588d0af1839c5bf2d37e3da2b5a2826a49c824441a14e9c078eb2bdb91'
            '596e4a94073169a2d5e10f2dee9109a9646f64172b5af258beafe043ad273e76')

package() {
    msg2 "Copying source files..."
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.jar"

    msg2 "Creating executable file..."
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    msg2 "Creating desktop entry..."
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
