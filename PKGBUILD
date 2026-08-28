# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=snag
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern stream pattern extractor"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('ea692c2e30d8924fa0177a01cbf2587bf4a7ce1e8d82b6a3640103d82b94c0af'
            '74aa0323e148d20744f4f0edc45ecdd60dbaf728b612be1edcdde6bbcc7b60ea')
sha256sums_x86_64=('65b72a7ecb0fff62fc6f5b38c22848bb7afe0bca35725d871553888ef82146fa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
