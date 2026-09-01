# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=joewalnes
_gitname=zepto
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, intuitive, terminal text editor. Single file. No dependencies. No config."

pkgver=2026.09.01
pkgrel=1
_gitversion=7193c6e

arch=('any')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://zepto.now/"

license=('MIT')

depends=('perl')
provides=("${_appname}")
conflicts=("${_appname}")

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"BUGS-${pkgver}.md::${_ghurlraw}/bugs.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"CLAUDE-${pkgver}.md::${_ghurlraw}/CLAUDE.md"
		"DESIGN-${pkgver}.md::${_ghurlraw}/DESIGN.md"
		"FEATURES-${pkgver}.md::${_ghurlraw}/FEATURES.md"
		"ABOUT-${pkgver}.md::${_ghurlraw}/docs/help/about.md"
		"TUTORIAL-${pkgver}.md::${_ghurlraw}/docs/help/tutorial.md"
		"CHANGELOG-${pkgver}.md::${_ghurlraw}/docs/help/changelog.md"
		"${_appname}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('9f3273e5e01858ed10ab7a253cbd6b1abd7259bd9b4b3fd1dfafc3bf902e89c3'
            'e5a6fcf12703e6b7826ed2d65c6e8b570e087305322edb13d37517afd945e94e'
            'ad91b2ec97463e826d9e76c3b1664b2f076fc0fc6e4c97866e43e48dc3a4ca05'
            '6a74434d8c7399a73618954398f89fff8ec6fd6a452ed44a3bcb2765b3ec6959'
            '28cfd9f48e4133cf5cd3f379952a2dde41b686636e65879b772ee2a55c3048df'
            '748f0b24d25218e6ead8ad002eb4e851497ff4331d7f09509ab7a55f162d0f64'
            '2c1d40500aec7391a4a692bdfb121b5bedbac96789387cac34519a530fe1c33f'
            '15bf14930e9d38d281a898e154a8cf20243a49f602e63096995d1b0f7a60b787'
            'ca78a99a761f4413c67e98f3604a7c2aebf7db1645080a814c44a8cc517c2568'
            'b5af3722db4486d8f76f4596f144ed24452472630942c09e5d6a8e3b590e7a82')


prepare() {
	cd "${srcdir}/" || exit

	chmod +x "${_appname}-${pkgver}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "TUTORIAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUTORIAL.md"
	install -Dm644 "FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURES.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "CLAUDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
	install -Dm644 "ABOUT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ABOUT.md"
	install -Dm644 "BUGS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/BUGS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
