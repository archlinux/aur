# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goretk
_pkgname=redress
pkgname=${_pkgname}-bin
pkgver=1.2.68
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A tool for analyzing stripped Go binaries"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('AGPL-3.0-or-later')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.tar.gz")
sha256sums_x86_64=('87228987e3b5156f4bc0c8cf66df3eca0b4a59137a608aac41a0533e7b978cb6')


package() {
	cd "${srcdir}/${_pkgname}-${_pkgvername}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
