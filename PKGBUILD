# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Shopify
_pkgname=shadowenv
pkgname=${_pkgname}-bin
pkgver=3.4.0
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
sha256sums_x86_64=('60e5dabd632cfd088876bdaf1dcd64d2a7f49a4464825f9cd5a7f1f79165501f')
sha256sums_aarch64=('129e5441b3a1228e4108aca930ec97bd0584b582c26cd48ad3c3c1a7836d2c3a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
