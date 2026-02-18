# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=MilkmanAbi
_pkgname=ytcui
pkgname=${_pkgname}-bin
pkgdesc="A lightweight terminal-based YouTube client written in C++"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'libstdc++' 'ncurses')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('03ee96a63b6af5880718460c16203ee2859d22a2387060509284eaae3015431b'
            '96e92d577146e125571a07a690ae7ba0cc2756b7a07d3af50833a26a1302daf9')
sha256sums_x86_64=('40ca67922dbe820646baef24e684eb68b27b5182b1d1b07632d5972552c27198')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
