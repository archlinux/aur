# Maintainer: notscripter <grx8x0mfy@mozmail.com>
pkgname=arattai-bin
_pkgname=arattai
pkgver=1.0.7
pkgrel=1
epoch=
pkgdesc="Arattai - Secure messaging with your friends & family."
arch=(x86_64)
url="https://www.arattai.in"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(arattai)
conflicts=(arattai)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}.rpm::https://downloads.zohocdn.com/arattai-desktop/linux/${_pkgname}-${pkgver}_x86_64.rpm)
noextract=()
sha256sums_x86_64=(3bee94c52b70cddd134aac537d277eacafb1ebfc8f4088120065cd0dbbf6113c)
validpgpkeys=()

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/opt/Arattai"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons"

    cp -ra ./opt/Arattai "${pkgdir}/opt"
    cp ./usr/share/applications/${_pkgname}.desktop "${pkgdir}/usr/share/applications/"
    cp -r ./usr/share/icons "${pkgdir}/usr/share/"

    ln -s "/opt/Arattai/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
