# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheSillyBoi
_pkgname=wretch
pkgname=${_pkgname}-bin
pkgver=1.4.0
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
            '64030bc38687696bd79c5dcbe6e261c94e25a11c19f9beb562e10d8209cc7a61')
sha256sums_x86_64=('72086adb21854f421e6a96175b585a8de9a4afb9ee2c07fffbe4d64653ea7dcd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
