# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=tedit
_pkgauthor=RobertFlexx
_pkgname=tedit
pkgname=${_pkgname}-bin
pkgdesc="A command-line text editor inspired by ed/ex"

pkgver=2.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'libstdc++')

source=("MANPAGE-${pkgver}.1::${_urlraw}/mandoc/${_appname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('7decb4299bcde5dc8e2af8e67833225a666e5784dfd8a53212c5d645e6133327'
            'e3e267e8c6ba331c9b85688e1c6782b7c8ea9b51b606b14e0c95a395d042b1df'
            'e765681d9c8c02828c6e27356b9579fea63c562c8d8afc3dd0671429821efcd0')
sha256sums_x86_64=('e30d81b72f200517f68ddcf20e20950048a965a589b962a099f13a2a3826a5cf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
