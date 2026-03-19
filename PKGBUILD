# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=projectdiscovery
_pkgname=katana
pkgname=${_pkgname}-bin
pkgver=1.5.0
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
sha256sums_x86_64=('592890e5febaf5706d0a962d96299512418d6eccce6388cf1600e1f078ed359d')
sha256sums_i686=('5f565631fceada7befb7aa258ac7b2ca26263afc7e83741edb889f2452eac83e')
sha256sums_aarch64=('ca03709887bbf23b2110d48bbf8aeacc5cb0915c8dda0f035dc79a53bcfd68e4')

options=(!strip)


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
