# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=projectdiscovery
_pkgname=katana
pkgname=${_pkgname}-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A next-generation crawling and spidering framework"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.zip")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.zip")
sha256sums_x86_64=('0e783d296534ec85b9ed4ed0f8a04e7f59fcea6c5b2237cf7aaad7f7de22e67b')
sha256sums_i686=('53c513d3a438ce0d83295b5af31af4f1c56d59d0fb8b847371d05df9d502dd70')
sha256sums_aarch64=('8030a8d46a87a20b31b93be6bc42bb79e084b1df4437114a44b6ddbe4b479d6d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
