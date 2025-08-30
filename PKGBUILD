# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dhth
_pkgname=squidge
pkgname=${_pkgname}-bin
pkgver=0.2.3
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Shortens delimited data"
_binname="sqdj"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('gcc-libs' 'glibc')
provides=("${_binname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_binname}-${_barch[0]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('c0791b8c8140490207f9c3199ab0ca313a2ce5ae2aaeb6404dc549a8861ab26f')


package() {
	cd "${srcdir}/${_binname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
