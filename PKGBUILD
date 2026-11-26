# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Husen <hi@husen.id>

_pkgauthor=plentico
_pkgname=plenti
pkgname=${_pkgname}-bin
pkgdesc="Static Site Generator with Go backend and Svelte frontend"

pkgver=0.8.6
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
sha256sums_x86_64=('6e0151b97c746420751e2375ff99faee8d48c082dfd310361d616a8ff3912016')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
