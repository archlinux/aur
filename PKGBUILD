# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=RahulSandhu
_gitname=notse
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI for taking notes inspired in clipse"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('2b32d33a2bc22d5988d8b34b98b03b264bbb1cca2d6197e7b1a0c5efd57042e7'
            'aecda32055fbe3f21152d13935a88aa23e6a7be2942779fd7752187da3e0045e')
sha256sums_x86_64=('47b7055a5c15114dff1426f68a5165692b7a9fb3b778ecaca09c4cdaaf7b57da')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
