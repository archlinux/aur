# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neur0map
_pkgname=manx
pkgname=${_pkgname}-bin
pkgver=0.5.4
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Blazing-fast CLI tool for developers to find documentation, code snippets, and answers instantly"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'openssl')


source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ABOUT-${pkgver}.md::${_urlraw}/docs/about_manx.md"
        "AI_FEATURES-${pkgver}.md::${_urlraw}/docs/AI_FEATURES.md"
        "COMMANDS-${pkgver}.md::${_urlraw}/docs/COMMANDS.md"
        "CONFIGURATION-${pkgver}.md::${_urlraw}/docs/CONFIGURATION.md"
        "EMBEDDING_SETUP-${pkgver}.md::${_urlraw}/docs/EMBEDDING_SETUP.md"
        "NEURAL_SEARCH-${pkgver}.md::${_urlraw}/docs/NEURAL_SEARCH.md"
        "RAG_GUIDE-${pkgver}.md::${_urlraw}/docs/RAG_GUIDE.md"
        "SETUP_GUIDE-${pkgver}.md::${_urlraw}/docs/SETUP_GUIDE.md"
        "SIMPLE_EMBEDDING_SETUP-${pkgver}.md::${_urlraw}/docs/SIMPLE_EMBEDDING_SETUP.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '3fde8610483eccd981bbab71fe50103440fd1d46b8d2ff91675ba33236264123'
            '5f9786bf2f5c1ce1cb5aca7e0bac368594f026a36730be808b7d614e5ff775a1'
            'c1ca97ab0e0c6caaf7c27e98a43e777582c1695b1b73e8a465ee3f88ebf4d41d'
            '37ddcac8c7ede23a23143760887caf31cba2dfa20aa73b03472c4043cc5e063d'
            '829a8b7f9c952aaa7b9a429e8f5c2e88770008c867061bc93bcb71e6829deebf'
            '0c6d805c460333011f92510d55210e6b6da630c811aa147d430031412287e947'
            'c0c0f90f37b2e7c1a33a931a939ef2d0285e4952300d3a458b11fca1f5abf8ba'
            '3a278b39c82315940e1f6446dc100e19892f5234fb71c1c1a22bad1b8d4c0167'
            '1af915cd758b9b54f201e5444057f4813abd4be4dea39f2583b6b858db05847a'
            '42a63ac0dc3dfa2893ba41526774e82ba87ec85f579888c054f6dfbc0623e7dc')
sha256sums_x86_64=('92bc884869feece87873f0d9807402cfc75a50daef72ad48a44eaa8e80662b00')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "ABOUT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ABOUT.md"
	install -Dm644 "AI_FEATURES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AI_FEATURES.md"
	install -Dm644 "COMMANDS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"
	install -Dm644 "EMBEDDING_SETUP-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/EMBEDDING_SETUP.md"
	install -Dm644 "NEURAL_SEARCH-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NEURAL_SEARCH.md"
	install -Dm644 "RAG_GUIDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/RAG_GUIDE.md"
	install -Dm644 "SETUP_GUIDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SETUP_GUIDE.md"
	install -Dm644 "SIMPLE_EMBEDDING_SETUP-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SIMPLE_EMBEDDING_SETUP.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
