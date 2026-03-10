# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=spider-hand
_pkgname=recall
pkgname=${_pkgname}-bin
pkgdesc="A CLI tool to find commands by describing what you want to do when you forget them"

pkgver=1.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
sha256sums=('e6ff500468e1e0f2fac5c583891fba89a42dc9eaf77a2a08844996ee5c044a0e'
            '0809f5aba87d64f15153c4210ddb825508a73931af737be314ff49a4749e687d')
sha256sums_x86_64=('e6b9bd455c733d5c3d9d16b06b44465609f2feff2043d4588ec1521e04af9a81')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
