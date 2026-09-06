# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=joewalnes
_gitname=zepto
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, intuitive, terminal text editor. Single file. No dependencies. No config."

pkgver=2026.09.06
pkgrel=1
_gitversion=99c9aab

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
		"ASKS-${pkgver}.md::${_ghurlraw}/ASKS.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"CLAUDE-${pkgver}.md::${_ghurlraw}/CLAUDE.md"
		"DESIGN-${pkgver}.md::${_ghurlraw}/DESIGN.md"
		"LESSONS-${pkgver}.md::${_ghurlraw}/LESSONS.md"
		"FEATURES-${pkgver}.md::${_ghurlraw}/FEATURES.md"
		"SECURITY-${pkgver}.md::${_ghurlraw}/docs/SECURITY.md"
		"CODE_QUALITY-${pkgver}.md::${_ghurlraw}/docs/CODE_QUALITY.md"
		"UI_GUIDELINES-${pkgver}.md::${_ghurlraw}/docs/UI_GUIDELINES.md"
		"FIND_REPLACE_SPEC-${pkgver}.md::${_ghurlraw}/docs/FIND_REPLACE_SPEC.md"
		"ABOUT-${pkgver}.md::${_ghurlraw}/docs/help/about.md"
		"LICENSE-${pkgver}.md::${_ghurlraw}/docs/help/license.md"
		"TUTORIAL-${pkgver}.md::${_ghurlraw}/docs/help/tutorial.md"
		"CHANGELOG-${pkgver}.md::${_ghurlraw}/docs/help/changelog.md"
		"${_appname}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('9f3273e5e01858ed10ab7a253cbd6b1abd7259bd9b4b3fd1dfafc3bf902e89c3'
            'e64a80b64373867e52ceadc568fcfb0db6e78cf9b2b41cdfc56c0376a4c2a8c6'
            '9f4cd4defc1c79b3fd6cbf42572b29165e5aa30704e5a25913cf8192db1a49f7'
            'ad91b2ec97463e826d9e76c3b1664b2f076fc0fc6e4c97866e43e48dc3a4ca05'
            'f1bba84a3e08422d785cfde0d2ead51eeef9393cc5b1a8f44301ca6c23437d1e'
            'e3690b13258271c2083188dcb016ef266ee11756cc5528949bbaf1e1a70ef2c0'
            'e579ffbb3112266a35e5d67d516d107d80381ed81a7408d71637a06df4a07cd2'
            '01dd0a193a330bf8af74960a779fe25d8371ef7ba2797b73b100fc15f8ed3740'
            '286819d0c9035ce30cf4e49f35024ed252dfcd83b361b4b665fa3d24ff4d30ae'
            'deebe1ae0665ca208fd1cd5778632b22b0886f3a3817fcab76d08b9c8d0bd2b0'
            '3868d83ddf5ec773b06bc20385eac7d3f95964d00bf9c75ee91f8be6f21d4538'
            'c615886c4e71268fd066bdb482e3c33bea2fcf88dff445a49368d1241aedde58'
            '2c1d40500aec7391a4a692bdfb121b5bedbac96789387cac34519a530fe1c33f'
            '84ea3ad12fa76e27f2e64add84a9b3fc50986c426b2b6fd65df3f582f3f20661'
            'a17e4bdadbf7d0ca0cac128a3ad33a7b2364480f023562355ad9984002883ec1'
            '1b7138600c571733cd703da4c590d254158af44007da6b2e13a9b0412b672e80'
            '9e05087f24015c6cbddb480455ba0ae7a4b941ec2f94043c092905aca77c8e75')


prepare() {
	cd "${srcdir}/" || exit

	chmod +x "${_appname}-${pkgver}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "FIND_REPLACE_SPEC-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FIND_REPLACE_SPEC.md"
	install -Dm644 "UI_GUIDELINES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/UI_GUIDELINES.md"
	install -Dm644 "CODE_QUALITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_QUALITY.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "TUTORIAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUTORIAL.md"
	install -Dm644 "FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/FEATURES.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "LESSONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/LESSONS.md"
	install -Dm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "CLAUDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
	install -Dm644 "ABOUT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ABOUT.md"
	install -Dm644 "ASKS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ASKS.md"
	install -Dm644 "BUGS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/BUGS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
