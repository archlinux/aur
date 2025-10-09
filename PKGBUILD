# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AvengeMedia
_pkgname=dgop
pkgname=${_pkgname}-bin
pkgver=0.1.6
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
            '258c35d14d64ec8d372d5176da39cd8b55ddc6f3966b29f3ec61be97557e46fa')
sha256sums_x86_64=('16eab9e38379a5ff0b42e81d9b36f1f3cac2ffd5d2490fb35d2a4fdd3a0e99a9')
sha256sums_aarch64=('7901be44b30446b2a3834827635e74f0c186e385c89b888acd0666adc10f490e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
