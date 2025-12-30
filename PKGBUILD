# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lqqyt2423
_pkgname=go-mitmproxy
pkgname=${_pkgname}-bin
pkgdesc="Golang implementation of mitmproxy that supports man-in-the-middle attacks and parsing, monitoring, and tampering with HTTP/HTTPS traffic"

pkgver=1.8.8
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
sha256sums_x86_64=('2539ba87a8a99ec24d403ad19cf6e82022514bf9ceb332bcae938db6dbecdc56')
sha256sums_i686=('d6b6c48b526905e33f4a05aaab0dff50f3e8d3553abc09ed42b48eb1c2b34aa1')
sha256sums_aarch64=('a8732c7d3d5addf03db9c8d1c72ac166d05cdfd9aaf34381ac4b7fd4c4618146')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
