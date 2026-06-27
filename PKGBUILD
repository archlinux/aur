# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ABDsheikho
_gitname=histclean
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cli tool to clean command shell history files"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}")
sha256sums=('ea516eb3487e7dd1b3fd3cd232fd4070a3954a5aec540655a3c56e1a99883cf1'
            'df06e67e87dd5337a166b9449f35d92f254e8d60b536a0224aad920670ee2cc6')
sha256sums_x86_64=('2a3ba9be8dd97e1cf6b39d3587c2de0a33e0d1b6a39411ab649843dbc5d00e2c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
