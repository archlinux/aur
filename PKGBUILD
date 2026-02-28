# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=andys8
_pkgname=git-brunch
pkgname=${_pkgname}-bin
pkgdesc="A git command-line tool to work with branches"

pkgver=1.8.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-Linux")
sha256sums=('f3007a3b5edc3b8652a67f0a0a2cd1b0cd67c8a527795173b442fef2beb3b2cb'
            'bac052cd68429fc02260e546ca66d5e491a16d70fcafa27e17fb24451eb0db15')
sha256sums_x86_64=('2422ab77996a39876c1ee0b4981f472bfc1d7040b5e1cf11fc73cf0c2a1e5d0d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
