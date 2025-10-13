# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ameshkov
_pkgname=gocurl
pkgname=${_pkgname}-bin
pkgver=1.5.0
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
sha256sums_x86_64=('70e5cfe5fb0cc3468a538d55fc493e1f44392462d86d183340c16029be7aa779')
sha256sums_i686=('9d324eb8a1a38de63386fa094d3f9d858209a8006aa535d5f7b5282c2ca53df6')
sha256sums_aarch64=('9363a2e393ff360db20399e3fe37f6600bad7611aa78dd747952dedadd042dd5')


package() {
	cd "${srcdir}/linux-"* || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
