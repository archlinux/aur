# Maintainer: Simon Späti <simon at ssp dot sh>

_pkgauthor=ssp-data
_pkgname=neomd
pkgname=${_pkgname}-bin
pkgdesc="A minimal email TUI where you read with Markdown and write in Neovim"

pkgver=0.6.6
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
sha256sums_x86_64=('81f8a429e83498d6339691a3b421494731b94f39ac4f32cfbae2a17c41ca214a')
sha256sums_aarch64=('dc6641ec7b2597b11a89317e720992aa413ce2885bf02f01caf91f20207ae253')

package() {
    cd "${srcdir}/" || exit
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
