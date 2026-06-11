# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Ra77a3l3-jar
_gitname=replaySh
_appname=${_gitname%%Sh}
pkgname=${_appname}-sh-bin
pkgdesc="⚡ Replay — Record once. Replay forever. — Stop writing shell scripts. Start recording workflows."

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('3a6f89b7a62ebf24e9e0cf86cf889fb4ccd60a467827ff77327942a3eb4ab188'
            '3fe0dd18e800114c3ab4b6da948453320b9fdb95260c52d1fba4c87dda2fb583')
sha256sums_x86_64=('93f3624601fe0b78cb084333d0f81921362fa53eb3b0da50610836007790bdff')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
