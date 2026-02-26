# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=SourcewareLab
_pkgname=Toney
pkgname=${_pkgname,,}-bin
pkgver=2.2.1
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
sha256sums_x86_64=('e84a45551c715fc071627b2a4a07b274390fee93febaf8d0d4ae0e3bbc67e279')
sha256sums_aarch64=('924308aa67ce135d9ff39af85f6c05fa5b280e291a3faa8ece659245f240e05b')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
