# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=SourcewareLab
_pkgname=Toney
pkgname=${_pkgname,,}-bin
pkgver=2.2.3
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
sha256sums_x86_64=('1bc74d35c4eae212223b1ea04a17cf39ecead9f6a5ce8d434c4cd7cb45a70c9b')
sha256sums_aarch64=('64096ce96eb3cdd50ecae1ef2d30b63353b80125d8c3adeb200d09a35b3e62f9')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
