# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-server-bin
_pkgname="${pkgname%-bin}"
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple command line notebook for programmers (Server)"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dnote/dnote/releases/download/server-v${pkgver}/dnote_server_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ed10a3a0484c3fce800faa0f786b1656b9edbf66a0aeeb3261053d78496b8077')

package() {
	cd "${srcdir}"
	
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
