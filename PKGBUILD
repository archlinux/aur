# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jbreckmckye
_pkgname=daylight
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A command-line program for tracking sunrise and sunset times"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-only')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('efaf2492a52d900b6311921a35be31d65626aa26d5a14e3fb8f19476ceb28abc')
sha256sums_i686=('b3fcb17a177cd65db22ef68bde9ab87d5e3dd59d3a2fb3fc063e4410c02cddd6')
sha256sums_aarch64=('cc5f6405270d41b582b92a3b7a71a3c1c8bb52b8d46bd9418f8d6bfed2ba92ef')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
