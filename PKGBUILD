# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neurocyte
_pkgname=zat
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Syntax highlighting cat like utility"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[1]}.tar.gz")
sha256sums=('a94267d8368fada2db5e129000c201ec7c8f58793c79fb26e4872c50bf28e3f8'
            'dad288859bc8b0a3ffc4d10d4eec9a5b06e3cec5eb67a44e3f6f27584148a649')
sha256sums_x86_64=('469ab17e4b8c5ca1c25f1d0813c30ce88f539b9d70efa9227d56885a7b0d6811')
sha256sums_aarch64=('5d1d45b57d90b5a2cc4848ede611d6045e44f35c35a9cb61df4d480ef679b235')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
