# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=SourcewareLab
_pkgname=Toney
pkgname=${_pkgname,,}-bin
pkgver=2.2.7
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
sha256sums_x86_64=('5e249feaa8933d999979621db03f4c7646b876054ec81b9f167429c57f52f956')
sha256sums_aarch64=('f758d1f5e697bcc2578d3ddb6397eb16d3353088bde505171cfdb8e63e8c4f32')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
