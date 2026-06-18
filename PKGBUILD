# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Shopify
_pkgname=shadowenv
pkgname=${_pkgname}-bin
pkgver=3.5.1
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
            '0499aa540e54c74cc0e598cd2d4c28711f3f96e1c61da41dd925014bfcc0f4d7'
            '00d6c0fdfa9ce946849943a4ad9c4d6f2c5caee3124f6fe116f4c699d28af601')
sha256sums_x86_64=('612e10af532b2469715a32d706fd65b03bcc59d6f69724a45a1d292e27df04b8')
sha256sums_aarch64=('6d9bbb999a65776741d963bf91f4b94293992fd205224e8da9c3d9f82ec1b6a0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
