# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheSillyBoi
_pkgname=wretch
pkgname=${_pkgname}-bin
pkgver=1.3.3
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
            '7e55751225a2d5cc9ce3730729b5095b32c904f2a667809fb8bea6f4daca953f'
            '653cb8808e51ce890f8d37569e9c9629809dd02d98178a99e4696f72c6273f45')
sha256sums_x86_64=('b998965062cdf9086f63b19f291fb35d6a9eefbe875789e0b345f5358790a531')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
