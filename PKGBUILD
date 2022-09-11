# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Jared Meeker <jared[at]meekers[dot]org>
# Contributor: Dimitris Kiziridis <ragouel[at]outlook[dot]com>

pkgname=dnote-cli-bin
_pkgname="${pkgname%-bin}"
_shortname="${_pkgname%-cli}"
pkgver=0.12.0
pkgrel=2
pkgdesc="A simple command line notebook for programmers"
arch=('x86_64')
url="https://www.getdnote.com/"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_shortname}/${_shortname}/releases/download/cli-v${pkgver}/${_shortname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cf769acd15d4a6885181e8bde298487b7c76eddb6afc0fea88fb1642de4c4401')

package() {
	cd "${srcdir}"

	install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"

	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_shortname}"
}
