# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=SourcewareLab
_pkgname=Toney
pkgname=${_pkgname,,}-bin
pkgver=2.2.4
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
sha256sums_x86_64=('4389eaa57551f55d18a7d4370ced8c7f9c0c1fe21cda07aad28a1c3e9b6ede1f')
sha256sums_aarch64=('c693a010212f8777240a28061cbcb079f2ef358727e93c1b3db9fe95fcad17ae')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
