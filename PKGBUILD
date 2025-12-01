# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=projectdiscovery
_pkgname=katana
pkgname=${_pkgname}-bin
pkgver=1.3.0
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
sha256sums_x86_64=('abac886b742c0f6aa3c68a69bc1c75fb56f9be98c59cc5eb08a9ab054fa86531')
sha256sums_i686=('e09772c9bcbbe4c2dc6e590697f0090d2c775637af6ab0fe5ed427cb0d898d42')
sha256sums_aarch64=('5288308266469e441b5e60536bdbdc876efcc9bf9f4c7698b562636af8b9cb25')

options=(!strip)


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
