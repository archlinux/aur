# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Marko Korhonen <aur@marko.korhonen.cc>

_pkgauthor=go-shiori
_pkgname=shiori
pkgname=${_pkgname}-bin
pkgver=1.8.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Simple bookmark manager built with Go"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}_${pkgver}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}_${pkgver}.tar.gz")
sha256sums_x86_64=('20552c4d91c720dc9786d73a7f5b68abd9ed32addb177861f89ea5d4e5937d3f')
sha256sums_aarch64=('ebfb94cc5ab955f379ec3af0b7194191f3989096ad37e7cb59e9ef3c12528fba')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
