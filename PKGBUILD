# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=monjaris
_gitname=dotty
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Simple, Modern dotfile manager for Linux/BSD/MacOS"

pkgver=0.4.9
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
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('5cb7782b1f47f4122dd767dcadd0e8434b94fe3cd55f90db82b927a63940b934'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('13fdac23d4dc366769b9198978c60f3beedceed3ee8b534f414dd55c83e9d7f3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
