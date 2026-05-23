# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=OmkarVijayBagade
_gitname=zor
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal-based TUI animation showcase built in Rust"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
sha256sums=('ea8fc56ef5c406f28bf64c0ac9b4e1d59cee0d5c5024f9f664690576fe189a44')
sha256sums_x86_64=('dfff1e3871d250fbba7433ae4be1e54eeaa386ab000d762bb2e7439ab9d1902b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
