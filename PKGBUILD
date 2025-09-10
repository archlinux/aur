# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neur0map
_pkgname=manx
pkgname=${_pkgname}-bin
pkgver=0.4.5
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

sha256sums=('b20cf353bcaa7861617f4ef7730e30bf76c065f67f07611aa40c6d09336b9ab4'
            '8b7a09c17b42a2b4ef1a9b0844ea7c6a0bdeecd554bc57db6484f85773e56f00'
            '5f9786bf2f5c1ce1cb5aca7e0bac368594f026a36730be808b7d614e5ff775a1'
            'afb2a90785a6c29d050d601004178e340b77fd826a0fc2057a0f7359d4e26ef8'
            'cae2fcfda8a68281f9cf36b1536428a852d620e32215562c533e9ecb8651424f'
            '02a1524b2ab4eede491d237f498c0050ef7de23178dbf4b07fe231ced1a793d9'
            'd584d93c3e0f96f72f28469afd4ad577351830fd2a377dd0c7cdfe7178372a4a'
            'd984b4096fa3d27a13ddbd3f0c33907dd2b3b7ccdfd5ba99142a88e041e9d331'
            '51e35bbb0a4ce191d9f192ceb21f4dc58963cae750ffadb4810bcce9c74d453e'
            '3d8a4c6506f28e845479885fe6de072c80f409f8a8d2c6a0c91ba883ce607513'
            '2b5f13cc1fc19595065a48286d7d701bdfb3e2ef7098ac19af26fece34fb1756')
sha256sums_x86_64=('c985ede6f90d95f075df1313709bd0ec3f175d39025c5eddb0f42bc073573032')


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
