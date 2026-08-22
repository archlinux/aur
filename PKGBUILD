# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hjson
_pkgname=hjson-go
pkgname=${_pkgname%-go}-cli-bin
pkgver=4.7.0
pkgrel=1
pkgdesc="Hjson in Go"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname%-go}_v${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname%-go}_v${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname%-go}_v${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums=('a3b3d309b774913dafd47225c1c6bbed1b23aa1780ca1cc89ea1bad0d82cf7b1'
            '1efa3b9ddaa20f92cc14028302b104bf90962656bd17b23cfe06cb5813433789')
sha256sums_x86_64=('80eabd3bdcce2472ad497df1b59925ba6062e8d73c924584b218830a80cc0c61')
sha256sums_i686=('59e6565b28fe5b0ecb77fffa4fba644a2290e14cc8927fba485f3519e0a2fa11')
sha256sums_aarch64=('2d014138789099ff6d0103e984e058c60d05afa15ecfd58385ade8a7e1cfca5b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname%-cli-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
