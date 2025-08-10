# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=xonixx
_pkgname=serv
pkgname=${_pkgname}-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Share easily file / folder over local network"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('5fabf1d1542af4e23f2eef9c46d179e0b6ca0cbd87114773b98e8cc339e1cd25'
            '19d9ec6bf44da5f66a7e0c525525c18516401e9ab6f9050da56ce35703c4bb3c')
sha256sums_x86_64=('05863072cd4b5a5b221434ca90db730133e1ab009c69e72c30188e6b8c69605a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
