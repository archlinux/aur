# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=joewalnes
_gitname=zepto
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, intuitive, terminal text editor. Single file. No dependencies. No config."

pkgver=2026.08.30
pkgrel=1
_gitversion=bb29170

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
            '74486b9a07fd068adc4bdde616b1898252a32e8e6340b31bf2f958bcecbc5660'
            'ad91b2ec97463e826d9e76c3b1664b2f076fc0fc6e4c97866e43e48dc3a4ca05'
            '8e1d0871a2ca667574c12329ced96d7219dff59f5e300de662520d1a20cfc3ac'
            '757e6fa391078cd3ab8b522b14021740e4a03f065173ad2fb7ece812fb0075b8'
            '4af4d7b4e5fe3a64e0b41ccd9d8691e1f74708682b1bb7945a8fd65f3935843f'
            '2c1d40500aec7391a4a692bdfb121b5bedbac96789387cac34519a530fe1c33f'
            '15bf14930e9d38d281a898e154a8cf20243a49f602e63096995d1b0f7a60b787'
            '52d678cf60138d26f1eab68efe27bf06d4d6a927d5f2fa94dc74a63eb6aebaa5'
            '91841e10b19ce32f1a5697c8bafe793b593450b08949ab9001f5f282b1bee3e5')


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
