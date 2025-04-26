# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dalance
_pkgname=amber
pkgname=${_pkgname}-search-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A code search and replace tool written in Rust. Inspired by ack, ag, and grep."
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}-search")
conflicts=("${_pkgname}-search")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-lnx.zip")
sha256sums=('ff1d92e0d4a51bdd353d8f436dad6d6afe85b684eb9365301cbb76e9c564362f'
            '3820df22c23449eb199267c17cdf7cc4928ca9d8277205aa5ca376d0061ee942')
sha256sums_x86_64=('139630ebdbd1170efc92892b64bf2e48d18f1cd38e48c501c045af1e5852ad66')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "ambs" "${pkgdir}/usr/bin/ambs"
	install -Dm755 "ambr" "${pkgdir}/usr/bin/ambr"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
