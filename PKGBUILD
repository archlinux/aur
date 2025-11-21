# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=sbom-tool
pkgname=${_pkgname}-bin
pkgver=4.1.4
pkgrel=1
pkgdesc="A highly scalable and enterprise ready tool to create SPDX 2.2 compatible SBOMs"
provides=("${_pkgname}")
conflicts=("sbom-tool" "sbom-tool-git")
arch=('x86_64')
url="https://github.com/microsoft/sbom-tool"
license=("MIT")

source=(
    "${_pkgname}-${pkgver}::https://github.com/microsoft/sbom-tool/releases/download/v${pkgver}/sbom-tool-linux-x64"
)

sha256sums=('4f58464fa97c3c36038cd9d9cf3a289e3a215bc17e945b5640b6900fd7c71211')

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
