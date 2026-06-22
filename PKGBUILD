# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Antiz96
_gitname=manora
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A simple CLI / TUI tool to display (or save) man pages as PDF files"

pkgver=2.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('man' 'groff' 'xdg-utils')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}")
sha256sums=('2f81fb0bf2e24128b3dbcc53a16fbe2606aaa178b06cb1693cba81ba5d915c69'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('cd32bab86d4cf5926ef2642e84ac76dd172e6bfdf72e40f0b7934a832bbf7b7d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
