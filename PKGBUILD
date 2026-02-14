# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Veirt
_pkgname=weathr
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A terminal weather app with ascii animation"

pkgver=1.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '88645c46f28ccb693f4f397383fc51f7cf7a41e457e0a1b1f335014a8c9ae93b')
sha256sums_x86_64=('a859d6e0969895abb89e736b398a07ee2df414df96228d5ac3b1754216bf0d00')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
