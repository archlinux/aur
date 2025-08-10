# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adamritter
_pkgname=fastgron
pkgname=${_pkgname}-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="High-performance JSON to GRON (greppable, flattened JSON) converter"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc' 'gcc-libs' 'curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-ubuntu")
sha256sums=('a3e6a469b23997e436e2748a58f904e2d02756c798a06079e109f6bbb08b3672'
            '2748098bf2007120294360081f8b73e91a31dd736a0c43d8cbd82fa4905c855a')
sha256sums_x86_64=('e1d4ea072f4453b322bb1e57a406cfa33208d00bef94b4b4ab3c7bcb7bdf743b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
