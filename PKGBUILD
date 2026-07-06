# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ahkohd
_gitname=oyo
_appname=oy
pkgname=${_gitname}-bin
pkgdesc="A diff viewer that works two ways: step through changes or review a classic scrollable diff"

pkgver=0.1.39
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_gitname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"PERF-${pkgver}.md::${_ghurlraw}/docs/PERF.md"
		"DEBUG-${pkgver}.md::${_ghurlraw}/docs/DEBUG.md"
		"THEME-${pkgver}.md::${_ghurlraw}/docs/THEME.md"
		"PROFILING-${pkgver}.md::${_ghurlraw}/docs/PROFILING.md"
		"DIFF_VIEWER-${pkgver}.md::${_ghurlraw}/docs/DIFF_VIEWER.md"
		"DIFF_PREVIEWS-${pkgver}.md::${_ghurlraw}/docs/DIFF_PREVIEWS.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('ada39b6fcd5ff630d02ab5b802a0000cc688ef6c1f1e05778e363db63d1df4a3'
            'dd74642053f6f4695a33f1925e9236fc6349f0d1916569ce0a3cb984d38e0275'
            '8e8d39c61c686065347853063eee16a5969b78999f81507c2c8d644ac2cad4b6'
            '6a3476fa886d241ec2a08b6739b2f927b7cc071b4a160797aa7b51622fdaf7c9'
            '3343976c440e429946d389ef3dcdc3203b3e86a5f369f4723b6746ea71e75ae8'
            'a60bcb8c2d484ef140693a9292ed92da23e093abf5770d4cd1abe1f5cb267dc0'
            '8157c5df5894f6b4893b786ebcceefbef63a4cfe6e3a9b0d1ef98cd4aa7b6452'
            'd81308529db4f60ab7b16e2c913c346808dc31c84b8e57ac602069e32e720b94')
sha256sums_x86_64=('8f34a914b134fd32f1eaf6289a1b9a3362757ccc8e9d3a3e1ebcbd70a60cbd6e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "DIFF_PREVIEWS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DIFF_PREVIEWS.md"
	install -Dm644 "DIFF_VIEWER-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DIFF_VIEWER.md"
	install -Dm644 "PROFILING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PROFILING.md"
	install -Dm644 "DEBUG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DEBUG.md"
	install -Dm644 "THEME-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/THEME.md"
	install -Dm644 "PERF-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERF.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
