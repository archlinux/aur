# Maintainer: Simon Späti <simon at ssp dot sh>

_pkgauthor=ssp-data
_pkgname=neomd
pkgname=${_pkgname}-bin
pkgdesc="A minimal email TUI where you read with Markdown and write in Neovim"

pkgver=0.6.7
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
sha256sums_x86_64=('f8ee76f3c5e1102c85d988fb45a9b069c13bfdffedf56afb5cb04e2b46b1b5a9')
sha256sums_aarch64=('db961ce0fabe09e55494c0d2ab7029a0727bbed67157b985b14440aa742a4bbc')

package() {
    cd "${srcdir}/" || exit
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
