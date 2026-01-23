# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=andys8
_pkgname=git-brunch
pkgname=${_pkgname}-bin
pkgdesc="A git command-line tool to work with branches"

pkgver=1.7.2
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
            '4f946e55072260651c86f76d134e5536dd25a5929bad8214a41bd378a369df23')
sha256sums_x86_64=('0d577ef14b40a95943f39d9bc14d143d2aafdfd309376aa810e08f9098696640')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
