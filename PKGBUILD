# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheSillyBoi
_pkgname=wretch
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-release-${pkgver}-linux")
sha256sums=('f12c6f6b5b0accd597242e5c91fb886d89442197119da9b96a6a96bc7de06243'
            'dc10f827056d8938fca83d3e215e738bbf2591f9cdf3e8781e632430dd5a9201'
            'a45b3b2226f14e2da5ecd39a4512060632585135244858fe51233928b9626759')
sha256sums_x86_64=('6b77017df6234e43751e5e3f4abd60b4b7991952d61457c33828ec047afd492c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
