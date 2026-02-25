# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ameshkov
_pkgname=gocurl
pkgname=${_pkgname}-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Simplified version of curl written in pure Go with additional features"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[1]}-v${pkgver}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[2]}-v${pkgver}.tar.gz")
sha256sums_x86_64=('50e6a04d7b92deb0ef87cc9e013d1727df8f0105574b2bcab3c9070c8eb2ff9a')
sha256sums_i686=('2b39fe672ef804332473b65a74589e8054666c49bd7f1374d9ac4ce74993f980')
sha256sums_aarch64=('f7f34351d87d1ca7acb9490fcd3f0c9cdec8ad418d8560cab398a3fad0226492')


package() {
	cd "${srcdir}/linux-"* || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
