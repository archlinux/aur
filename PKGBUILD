# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=projectdiscovery
_pkgname=katana
pkgname=${_pkgname}-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="A next-generation crawling and spidering framework"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.zip")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.zip")
sha256sums_x86_64=('503754f1bd370c3ef287df6998e317baed2dd75bdd13ea64034f09b80ca393f3')
sha256sums_i686=('a9b7f78a7e571f39cb8cafc3b706d31989299517f09f0197f5fb0aa002c67a10')
sha256sums_aarch64=('663b4ed2c6559a7dacc819e816889940d567ff554ac3f543c8c8f9b50245cd45')

options=(!strip)


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
