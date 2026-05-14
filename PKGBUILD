# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ukroporg
_gitname=ukrop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Jump directories, run commands, connect to SSH hosts — all from one frecency-ranked, three-panel fuzzy TUI driven by shell hooks."

pkgver=0.18
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"USAGE-${pkgver}.md::${_ghurlraw}/doc/usage.md"
		"SEARCH-${pkgver}.md::${_ghurlraw}/doc/search.md"
		"COMPARISON-${pkgver}.md::${_ghurlraw}/doc/comparison.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('f1739dd5e11ac5e43a6ee58c8df3542eb258a70c523d18c0441e80ad9b87110d'
            '7a41aba0e8aa5287d3686fe73743a24e8506df72d52beb5c4c0234374e5a93b8'
            '6e0978e27f667af5f70fd63610ccc5d3e57b34d16ddfe1498c6b490ef97cbe6b'
            'd2d4a499c7eb73a88ea394d039861417836e92a3b4d2410defa6383dab88c56b')
sha256sums_x86_64=('0845ae189be186197d0191c60766cd85440629b289523ed2839fe5cc5454d9f6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SEARCH-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SEARCH.md"
	install -Dm644 "COMPARISON-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMPARISON.md"
}
