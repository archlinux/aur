# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=SourcewareLab
_pkgname=Toney
pkgname=${_pkgname,,}-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Fast, lightweight, terminal-based note-taking app for the modern developer."
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname,,}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname,,}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('e303f3b0ceb2aa1f2d1775d82d2b4ced55be1e3e7a1053c551931964903035bd')
sha256sums_aarch64=('ee9e965050b445638d1f7a961727c0f825de6e81b20b54401823507cf928ee5c')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
