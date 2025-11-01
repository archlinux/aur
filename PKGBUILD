# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=timharek
_pkgname=yr
pkgname=${_pkgname}-bin
pkgver=1.0.0
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
            'd35580bbb62d458031047617ac9d7d94a0276df20b4ace5e97b2791fee812748')
sha256sums_x86_64=('b0b0bef81ab4bdbb0b614c0c859aaaf75b671e31aefb73737f9ed5cbc451b306')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_pkgvername}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
