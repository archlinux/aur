# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Husen <hi@husen.id>

_pkgauthor=plentico
_pkgname=plenti
pkgname=${_pkgname}-bin
pkgdesc="Static Site Generator with Go backend and Svelte frontend"

pkgver=0.7.26
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('Linux_64-bit')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('dfb6790e386c974a16474a05b100d57134ef1e595d1618e78a12dc945863b47a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
