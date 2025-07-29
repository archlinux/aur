# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yarlson
_pkgname=lnk
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="🔗 Git-native dotfiles management that doesn't suck."
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[1]}.tar.gz")

sha256sums_x86_64=('e2be487437387c2c6016bb3096d5cb97bda7990d60b4e044862b156240d1de8b')
sha256sums_aarch64=('a0670955b1b4f7c41a973afaddbd4518eadb660e23fda348b5247c006665512b')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
