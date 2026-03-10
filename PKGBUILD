# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=tuco
pkgname=${_pkgname}-bin
pkgver=0.0.20
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
sha256sums=('11c252fdca2126c55b3e3ded0e7f6f7bc0a2a7ec05605f672097542d40f55e45'
            '8022f1ac4622ba48ec7f2b06cdf8480fc7193abb71de1b67a5dc07823d1af64f')
sha256sums_x86_64=('e3a8080678f1bdaf721c004bb323ef7e10258b718892b059f46321b6b5031ffd')
sha256sums_aarch64=('4b9649fad326218fa60fbdb6421560ed5d74206199bf0ae977c837fc0674aa8e')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
