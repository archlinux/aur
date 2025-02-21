# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=sbom-tool
pkgname=${_pkgname}-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="A highly scalable and enterprise ready tool to create SPDX 2.2 compatible SBOMs"
provides=("${_pkgname}")
conflicts=("sbom-tool" "sbom-tool-git")
arch=('any')
url="https://github.com/microsoft/sbom-tool"
license=("MIT")

source=(
    "${_pkgname}-${pkgver}::https://github.com/microsoft/sbom-tool/releases/download/v${pkgver}/sbom-tool-linux-x64"
)

sha256sums=('0300479eb164162460e9a0e4ea5253addb17658ce588f3e553501a79f83344d4')

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    ln -s ../lib/kotlin-language-server/bin/kotlin-language-server
}
