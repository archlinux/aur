# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lqqyt2423
_pkgname=go-mitmproxy
pkgname=${_pkgname}-bin
pkgdesc="Golang implementation of mitmproxy that supports man-in-the-middle attacks and parsing, monitoring, and tampering with HTTP/HTTPS traffic"

pkgver=1.8.11
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
sha256sums_x86_64=('df71ce3531be71bef5974d41b3eb810cd236b19ee667a22c4ea083c8dc161421')
sha256sums_i686=('3e1254aa9d58b4395e9dbae716f521de5a795f1f1ff96ba8af6d39c6c8a8b319')
sha256sums_aarch64=('32361fe7447bf9a1ac3df3a5070f266ab46b1e3b7cbf4e08eb7056904150dc99')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
