# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=projectdiscovery
_pkgname=katana
pkgname=${_pkgname}-bin
pkgver=1.2.2
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
sha256sums_x86_64=('67c67e0508a66849cbcc3431cdf92aa93cc5114cbb169eda07e0a8acd1cbbc28')
sha256sums_i686=('e06c56781722c6a4887f7220b8ffa6ee1dea77a1722c6d086f19f7c7a77995f2')
sha256sums_aarch64=('4a0c15c18bb39702c276ac3f07630f1d8a3bbacf798c8d75478b8749b46d5aa4')

options=(!strip)


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
