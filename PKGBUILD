# shellcheck disable=all

# ======================================================================#
#
#
#     ██████╗ ██╗  ██╗ ██████╗ ██████╗ ██╗   ██╗██╗██╗     ██████╗
#     ██╔══██╗██║ ██╔╝██╔════╝ ██╔══██╗██║   ██║██║██║     ██╔══██╗
#     ██████╔╝█████╔╝ ██║  ███╗██████╔╝██║   ██║██║██║     ██║  ██║
#     ██╔═══╝ ██╔═██╗ ██║   ██║██╔══██╗██║   ██║██║██║     ██║  ██║
#     ██║     ██║  ██╗╚██████╔╝██████╔╝╚██████╔╝██║███████╗██████╔╝
#     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝
#
#          Maintainer: Guillermo Galavis <druxorey@proton.me>
#
# ======================================================================#

_pkgname=sheets
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=3
pkgdesc="Terminal based spreadsheet tool (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/maaslalani/sheets"
license=('MIT')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('5868d162a2df4771cd36122ae8e608ca7afca3d38774b2d17e9727db816e9c69')
sha256sums_aarch64=('25e1a047e368a1fb91f4e9e48418b844f06c176bd3ce0b65fb80fcf15b8c2718')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!debug')

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	[ -f LICENSE ]   && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	[ -f README.md ] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
