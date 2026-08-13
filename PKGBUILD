# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=timharek
_pkgname=yr
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Get the weather delivered to your command-line"
arch=('x86_64')
_barch=('amd64')
url="https://git.sr.ht/~${_pkgauthor}/${_pkgname}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${url}/blob/${_pkgvername}/LICENSE.md"
        "README-${pkgver}.md::${url}/blob/${_pkgvername}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/refs/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.tar.gz")
sha256sums=('ae722945d7ed59cedb32ceca21ce674d4db89e362a182fe5f745eb52648c37b7'
            '2083a088d0f74be424a509df7f3828da8f91d3e32a0d98e511a91aaeb160311d')
sha256sums_x86_64=('2b640f86ffa4e8feeacfa0a2d4df9714bb38ceb6253a9a6691f0a2f6c6e22e00')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_pkgvername}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
