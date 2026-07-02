# Maintainer: Simon Späti <simon at ssp dot sh>

_pkgauthor=ssp-data
_pkgname=neomd
pkgname=${_pkgname}-bin
pkgdesc="A minimal email TUI where you read with Markdown and write in Neovim"

pkgver=0.8.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('4adebafed2e90be8bcb10014b9f2bc49986baae6f0d33a894a023a6cdb12bc07')
sha256sums_aarch64=('91c2c364660bdeeab8a52132ccab9c979d37c9696f2a4b0254d15c265648017b')

package() {
    cd "${srcdir}/" || exit
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
