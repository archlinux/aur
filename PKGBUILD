# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lqqyt2423
_pkgname=go-mitmproxy
pkgname=${_pkgname}-bin
pkgdesc="Golang implementation of mitmproxy that supports man-in-the-middle attacks and parsing, monitoring, and tampering with HTTP/HTTPS traffic"

pkgver=1.9.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('45ba75dbbc633fd1317ce581160277187b04cfe5495e2010b37d2daf91db5d97')
sha256sums_i686=('d7d63b6b98e7d5710970147bc6edd8880c50d8a8d43b044b231bcff3202b8134')
sha256sums_aarch64=('bcabaeb0bed52b98ae15a722e39d3bd4dee739702a22949732651ec4278368a7')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
