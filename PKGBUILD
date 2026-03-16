# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=tuco
pkgname=${_pkgname}-bin
pkgver=0.0.22
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Go port multiplexer"
arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-2-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tgz")
sha256sums=('ed39c95f02275a8b34385613d9c44d193c1c01b0617a9dfe0cb3fa73e02e44b5'
            '8022f1ac4622ba48ec7f2b06cdf8480fc7193abb71de1b67a5dc07823d1af64f')
sha256sums_x86_64=('1028db38f5ccc4d82f99c834705453a9f4c6cb16858c78ee61e8e1ff16b1ad3e')
sha256sums_aarch64=('9bdda64b86d81fb7f77530d5d6131d52ed956e5c0613c5dd072959a1486959b8')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
