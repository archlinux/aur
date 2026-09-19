# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=monjaris
_gitname=dotty
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Simple, Modern dotfile manager for Linux/BSD/MacOS"

pkgver=0.8.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
optdepends=('bat: For file logging')
depends=('glibc' 'libgcc' 'libstdc++' 'readline' 'ncurses' 'github-cli')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.txt")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('0f59a9ba130fd94d06c337ec0eeb230e81a148852ec47be5e6e97f18fdf858f6'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('ee711c5e2b4740a2635c53660ebf68f75ed0c5c56b407fca0fdb2249796aadf2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
