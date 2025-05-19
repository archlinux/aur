# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ameshkov
_pkgname=gocurl
pkgname=${_pkgname}-bin
pkgver=1.4.9
pkgrel=1
pkgdesc="Simplified version of curl written in pure Go with additional features"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[1]}-v${pkgver}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[2]}-v${pkgver}.tar.gz")
sha256sums_x86_64=('76d35842969d95a7f69a5f37243f83ce19eaee068176e991726638805361a046')
sha256sums_i686=('e3c2ad0ceb85ddfb2f072d430c8019afbbac1f930cf42c2c3e253171e76742fc')
sha256sums_aarch64=('4d5e54a3abccec08c9c1f39233f6034607b3ffa7604273e670a68e674904aba2')


package() {
	cd "${srcdir}/linux-"* || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
