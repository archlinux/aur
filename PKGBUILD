# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Shopify
_pkgname=shadowenv
pkgname=${_pkgname}-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="Reversible directory-local environment variable manipulations"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu")
sha256sums=('9b8aa2b6cfd0524eb03656d2fee8957d2a9a53f4be22f4fc00cd377349479007'
            'd9753222751c42c713cc768d26d07dc2135b91f895f1bd16d01a43e56ca50024'
            '00d6c0fdfa9ce946849943a4ad9c4d6f2c5caee3124f6fe116f4c699d28af601')
sha256sums_x86_64=('5ba6a0c1f236f9e3438dbe407ce01b6b321e980c69a07f1a31e5e536449ae8e3')
sha256sums_aarch64=('7b6ce2b9e5be2b3e04afa932bbfdd0dba92d655cfde9b7c18f3c63ebd9958d83')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
