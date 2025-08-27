# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=allocata
_pkgname=sip
pkgname=${_pkgname}-bin
pkgver=1.0.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Alternative to git clone for selective GitHub downloads"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('e92854e34dd352e5735d751251b0695b7235e7d1bc0e2deafd0ef39640dbac4c'
            '6290bef5c857d7d9183b9a67240eade48f5a8854db0037c737686608b43c3c29')
sha256sums_x86_64=('a30f3c794d7585b5b50a1fa29fbb32b23bac11c9b3657564bddd369cabbbf5d9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
