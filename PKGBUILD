# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=tedit
_pkgauthor=RobertFlexx
_pkgname=tedit
pkgname=${_pkgname}-bin
pkgdesc="A command-line text editor inspired by ed/ex"

pkgver=2.1.0
pkgrel=1
_pkgvername=version-${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'libstdc++')

source=("MANPAGE-${pkgver}.1::${_urlraw}/${_appname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('1db6be1a8a6336ae117a127378264ab7f6518e9190c7901c5af2353af9ac05ad'
            '8341a709fa75ec734ae8e3973d9c16a33d756950eab2223f7595ecfdd6da0293'
            'e765681d9c8c02828c6e27356b9579fea63c562c8d8afc3dd0671429821efcd0')
sha256sums_x86_64=('2f344b9d6f80ccf96cf9a1c7e6fcb8f7c5e979f34e5f170ded03b09aa36ec969')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
