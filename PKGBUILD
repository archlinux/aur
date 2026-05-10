# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Wilfred
_pkgname=garden
pkgname=${_pkgname}-bin
pkgver=0.24.0
pkgrel=1
_pkgvername=${pkgver}
pkgdesc="An interactive programming language"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}" "${_pkgname}-tools")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('56b326a30d59c674dcebc8ed4e3522972ea9cf9856270447c55e22145d772d9d'
            'd572b5bd48c0077a029b94d1c073e948b93599ba40d7df2b883ca4439f70f38b')
sha256sums_x86_64=('56f5bc0a0d15b84c19ec6750187578f0a2067fc3b616a0c670bd722f8cda1d5e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
