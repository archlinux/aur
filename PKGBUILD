# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mmcs-work
_gitname=git-explain-tui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Browse Git commits and diffs in the terminal, then use AI chat with selected commit, file, or range context"

pkgver=0.1.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('zlib' 'git')
provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${pkgver}-${arch[0]}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('0479b9ee8addaccc38581c2bb2cbb68cc4f0ed729b7ad4173a0b0ca45c8a8c05'
            '19f664a83c416d17c1d662ccde538c2532326c5e6fcc1c4116d3991f2f588112')
sha256sums_x86_64=('82737232535b2d5ca3a879eb94bf8d057e058f81bf237b636918b79268c5acaa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
