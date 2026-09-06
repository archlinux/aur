# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jmelahman
_pkgname=check-symlinks
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Check for broken symlinks"

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${_barch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('51be7a1a29abbb4ea28254f981fe42cee638dcb51f048100b98e21e957a9505d')
sha256sums_aarch64=('5f3ff8cc40d25a728f62dfc6cbe239f22032dbc82b91a9d249ba17357f2d8cc2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
