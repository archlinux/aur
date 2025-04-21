# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hjson
_pkgname=hjson-go
pkgname=${_pkgname%-go}-cli-bin
pkgver=4.5.0
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
sha256sums_x86_64=('09d85951df7fc040883e581cbb7f266dc1bab893d112c60e82687eabddd56607')
sha256sums_i686=('54408158ad37e2fc0792cac8a0cdb9b6d91f1c7ca7dff3e7b86a75245cf5f5f0')
sha256sums_aarch64=('e725f4e319c6649a750e0876f701c291bf1bb95a976b1c72c9fb79f0863d6dce')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname%-cli-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
