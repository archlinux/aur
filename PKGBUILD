# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=praetorian-inc
_pkgname=fingerprintx
pkgname=${_pkgname}-bin
pkgver=1.1.13
pkgrel=1
pkgdesc="Standalone utility for service discovery on open ports!"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch}.tar.gz")
sha256sums_x86_64=('95fc60543111be54113d4f0ea9e2e11a3cdb931cfcde79318c7b996d8e32357e')
sha256sums_aarch64=('95fc60543111be54113d4f0ea9e2e11a3cdb931cfcde79318c7b996d8e32357e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
