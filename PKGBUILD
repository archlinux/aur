# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thomasschafer
_pkgname=scooter
pkgname=${_pkgname}-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="An interactive find and replace in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('af818a9cb6e45a1317662644ec51a15b2f2cba198796b7b39db317766d206863'
            'a0dff44ac5b6d37b02ab1c096fcb5d8d8a2cd528960ed870f6ffeff845a48090')
sha256sums_x86_64=('9cee6b97cfc1c7afd663244fb6a06c32a5fe14f999f7cc88407ae2dc7fbd2464')
sha256sums_aarch64=('0f929cde5c1896762fed4a6f5495af2398a52f23d7c6a7f631964400aa6a776d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
