# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thomasschafer
_pkgname=scooter
pkgname=${_pkgname}-bin
pkgver=0.9.0
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
            '1325bed560ba2a3eee46b4da7a6a69ad3be5ff305deb28e9911151c4528f84bc')
sha256sums_x86_64=('5db85eaed5d1ba2d6c947f87d36a339f85e3f9740c2bc8d9a9febace64f31933')
sha256sums_aarch64=('a8ded19fab489b3ccbd75827f61c692e7871c354d41813a3c543d9e62fa42c31')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
