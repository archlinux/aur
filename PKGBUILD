# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hjson
_pkgname=hjson-go
pkgname=${_pkgname%-go}-cli-bin
pkgver=4.7.1
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
sha256sums_x86_64=('b00e9398a2ce719ade00afd508639fc426a1c42adcafb0c7681e68b0ce093a61')
sha256sums_i686=('6b41564b72221d59d2c8e69e5803f35777051b797d856ac5da02d6775346b417')
sha256sums_aarch64=('4689d1dc2aa4bccb3145972a0f80129b1259093c0093d48f740fe8d6c1d529de')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname%-cli-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
