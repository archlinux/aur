# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=joewalnes
_gitname=zepto
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, intuitive, terminal text editor. Single file. No dependencies. No config."

pkgver=2026.03.30
pkgrel=1
_gitversion=latest

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://zepto.now/"

license=('MIT')

depends=('perl')
provides=("${_appname}")
conflicts=("${_appname}")

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"ABOUT-${pkgver}.md::${_ghurlraw}/docs/help/about.md"
		"TUTORIAL-${pkgver}.md::${_ghurlraw}/docs/help/tutorial.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('9f3273e5e01858ed10ab7a253cbd6b1abd7259bd9b4b3fd1dfafc3bf902e89c3'
            '179b824a6a0258adde909aebf0f0b320a2495cbb655ad69d614c7a65803c4252'
            '2c1d40500aec7391a4a692bdfb121b5bedbac96789387cac34519a530fe1c33f'
            'b69a054e50829ddbc1f1d7aaa8aa6d3cfac9eb52c2ac85463e488bc30dc9bc46')
sha256sums_x86_64=('baf4c3f1eaf42496e5727e92634c3f049ba655c7334d095bfcc961499ca016f7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "TUTORIAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUTORIAL.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "ABOUT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ABOUT.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
