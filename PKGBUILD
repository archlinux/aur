# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AvengeMedia
_pkgname=dgop
pkgname=${_pkgname}-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="System monitoring CLI + REST API"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[1]}.gz")
sha256sums=('4cee96286c5b7da9763a4694868bb1853b33bb1558821e0c609ad2eabd426bfa'
            '742f6527a0dab4a540385ab77ad413d1e014d4f44b9e31f8df7d22d6d6dd5b86')
sha256sums_x86_64=('dbf27a5e740241c0cdae8cab66b44dd55313e37f931d63ff36bc3a577e371609')
sha256sums_aarch64=('8b5a1600089c62dec98ede6fdafcca19ced22e7a6c232efb10774d37a1679989')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
