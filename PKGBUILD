# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=kerlenton
_gitname=mcpsnoop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Wireshark for MCP. A transparent proxy that shows every real tool call between your AI client and your MCP servers, live in your terminal."

pkgver=0.13.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('4a6e0bd34566da85a8a0b65f28a4a5be875cc3b298019508f77f4936a6090f4b')
sha256sums_aarch64=('4a6e0bd34566da85a8a0b65f28a4a5be875cc3b298019508f77f4936a6090f4b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
