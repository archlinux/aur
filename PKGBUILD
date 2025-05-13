# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ameshkov
_pkgname=gocurl
pkgname=${_pkgname}-bin
pkgver=1.4.8
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
sha256sums_x86_64=('0dc7c7b5cfc773dc6afac240c320b671a291a04c690f6b55a9caf61a47c4c64a')
sha256sums_i686=('d3714e90a8de04b81333557730f1106992a8f8e5323a4ccbfcc46fef0ff14cc5')
sha256sums_aarch64=('98c536f3fab08b32b7e5dc9650031fba33e7c464db49773ea2c6a03ed5cfdfa6')


package() {
	cd "${srcdir}/linux-"* || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
