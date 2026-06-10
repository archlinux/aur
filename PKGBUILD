# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_gitauthor=Michael-A-Kuykendall
_gitname=shimmy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Drop-in OpenAI API Replacement for Local LLMs"

pkgver=2.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"README-DOCKER-${pkgver}.md::${_ghurlraw}/README-DOCKER.md"
		"CONTRIBUTING-${pkgver}.md::${_ghurlraw}/CONTRIBUTING.md"
		"DEVELOPERS-${pkgver}.md::${_ghurlraw}/DEVELOPERS.md"
		"ROADMAP-${pkgver}.md::${_ghurlraw}/ROADMAP.md"
		"DCO-${pkgver}.md::${_ghurlraw}/DCO.md"
		"SECURITY-${pkgver}.md::${_ghurlraw}/SECURITY.md"
		"SPONSORS-${pkgver}.md::${_ghurlraw}/SPONSORS.md"
		"CHANGELOG-${pkgver}.md::${_ghurlraw}/CHANGELOG.md"
		"CODE_OF_CONDUCT-${pkgver}.md::${_ghurlraw}/CODE_OF_CONDUCT.md"
		"RELEASE_PROCESS-${pkgver}.md::${_ghurlraw}/RELEASE_PROCESS.md"
		"RELEASE_GATES_CHECKLIST-${pkgver}.md::${_ghurlraw}/RELEASE_GATES_CHECKLIST.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('1034cfef3bdec513524461b96cf3fb72fe43ecf8750128d733386dbd238f39ef'
            'afe8a0980a52c3286dc790f8ae15d306957b3495301f282db2c3444192126593'
            '17314bc2502706734b456398c97d1f594ae913da5526fb889e0069b682961b35'
            '54111f34ed1a1dae03eb7350b573711b47014e2a028d4bad77ec5f862a552a7e'
            '0572f3e988a871eb7ab015ec42459e41048f56dec70067f3f83378e02b5f9ff2'
            'b089c4f432f79da43cc093f45ef52dbcd03f5ca933e92151c689edfe4cd516aa'
            'fadb391fb9b0cb56787a7adee21a76aed91058f2b9970ab8d5dd28fa00d48354'
            'c4e715a7cfccf17782cc11fe5a495922807dcce0970e8c4c11471eccb4d683b0'
            '1fe2cd32530b701dfb1f46db4c3e36fb0e24247074c3c86917440a80a9c26add'
            'e17b82ab91ef9646b2aa2d0ea4b800a949a9e7cc94273c6e03ebe82bb3f8ffd1'
            'f2de8fc1b1886db770e47306e2687fb21407499a0871b326f5ce7d033e5ce4a4'
            'fe6958982b1b11cf455e3366576c740e44511164febceb3d947c1b67ed98eadc'
            '13407a4bf45d95fb4c3db4e62d85e0d400a0891113172942ae436ed9b3e9ae85')
sha256sums_x86_64=('f376fabec7812f84edd43b303f4c4250438e1912b02be32bf2479ca4e1995dc4')
sha256sums_aarch64=('107a5a394367a1661e6b6e7a059ff0ad9f4145e707a02cf0572fea5de803582d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "README-DOCKER-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README-DOCKER.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
	install -Dm644 "DEVELOPERS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DEVELOPERS.md"
	install -Dm644 "ROADMAP-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
	install -Dm644 "DCO-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DCO.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "SPONSORS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SPONSORS.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CODE_OF_CONDUCT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
	install -Dm644 "RELEASE_PROCESS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_PROCESS.md"
	install -Dm644 "RELEASE_GATES_CHECKLIST-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE_GATES_CHECKLIST.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
