# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ziinaio
_pkgname=zmate
pkgname=${_pkgname}-bin
pkgver=0.3.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Instant terminal sharing using Zellij and SSH"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('4a6e49b536b97ff4c90017dc3879b51595a9e31d44ae68a1738b32f17a81a6df'
            '2c970705a635bdb075bff88fff48555148d69f2963eb326d3ec765ac8b1bea75'
            '4cb473572e710dab2df9d520b329b29734cf12cd90f7e192aa2290c523d33cc0')
sha256sums_x86_64=('224ccf11a83a11f1e1437d6bb06e2faa52a73658a6a73e19773c0c801d24b4ff')
sha256sums_aarch64=('e57357ea9f8667099dda6c1d1ded0e6e8ecc435f6da47925be8fa89f5e580e96')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
