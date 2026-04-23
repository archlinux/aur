# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thomasschafer
_pkgname=scooter
pkgname=${_pkgname}-bin
pkgver=0.9.1
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
sha256sums_x86_64=('ea619a20844b8833c220d50fc1cd5ccd8700dd1069685629fa0c5a6439d41045')
sha256sums_aarch64=('196c9ac34ab7d4135bb595b495f2bb3f40534328bf6b411120549e66984f05c0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
