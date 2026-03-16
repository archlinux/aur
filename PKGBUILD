# Maintainer: Mrinmoy <mrinmoym@duck.com>
pkgname=axiocnc-bin
_pkgname=axiocnc
pkgver=0.0.89
pkgrel=3
epoch=
pkgdesc="G-Code Sender Built for Stable, Predictable Runs."
arch=(x86_64)
url="https://axiocnc.com"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(axiocnc)
conflicts=(axiocnc)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/rsteckler/AxioCNC/releases/download/v0.0.89/${_pkgname}-desktop_${pkgver}_amd64.deb)
noextract=()
sha256sums_x86_64=(6358f613a76315003578316937c3419dc88167a795c522611e39ddac0969d0e8)
validpgpkeys=()

prepare() {
    tar -xf ./data.tar.xz
    # mv ./opt/AxioCNC ./opt/${_pkgname}
}
package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/opt/AxioCNC"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons"
    install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"

    cp -r ./opt/AxioCNC "${pkgdir}/opt/"
    cp ./usr/share/applications/${_pkgname}.desktop "${pkgdir}/usr/share/applications/"
    cp -ra ./usr/share "${pkgdir}/usr/"

    ln -s "/opt/AxioCNC/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
