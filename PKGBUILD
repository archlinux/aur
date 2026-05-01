# Maintainer: Simon Späti <simon at ssp dot sh>

_pkgauthor=ssp-data
_pkgname=neomd
pkgname=${_pkgname}-bin
pkgdesc="A minimal email TUI where you read with Markdown and write in Neovim"

pkgver=0.6.9
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
sha256sums_x86_64=('96f7b3838663330df219769f062f81bc0c5cd496f9f15d1a4959e0e6668f7878')
sha256sums_aarch64=('2c5787f3cd2d3e1c7f371d1d8129647e57cf17a20cb1f018d65249d88fe8348b')

package() {
    cd "${srcdir}/" || exit
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
