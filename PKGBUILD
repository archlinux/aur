# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sweetbbak
_pkgname=tget
pkgname=${_pkgname}-bin
pkgver=0.1
pkgrel=1
pkgdesc="Like wget but for torrents"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/V${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/V${pkgver}/${_pkgname}_Linux_${arch[0]}.tar.gz")
sha256sums_x86_64=('efe781958536f786e216125a9d385578d459211127b9eeb925a55c9137cabe38')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
