# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=vaibhav-mattoo
_pkgname=cxt
pkgname=${_pkgname}-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="A command-line tool that aggregates file and directory contents into your clipboard, perfect for providing project context to AI chatbots"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('7b7f5c05777003b721d6114361620e45ca5ebd477f33d4f52decc8a1c159e309'
            '627aff76ac30a87635be627485adcfdab4099e5544bbe0f681bc3a6d69da83e0')
sha256sums_x86_64=('df5a588c79e1d2e640bdb41a11974bd0ca0405647144e16c630727c745d4d2d6')
sha256sums_aarch64=('2a1b68e75fb4fa229abae265282592aa7274da3b879cf32b03aec003685a4336')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
