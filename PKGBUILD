# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ahkohd
_gitname=oyo
_appname=oy
pkgname=${_gitname}-bin
pkgdesc="A diff viewer that works two ways: step through changes or review a classic scrollable diff"

pkgver=0.1.34
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
		"PROFILING-${pkgver}.md::${_ghurlraw}/PROFILING.md"
		"PERF-${pkgver}.md::${_ghurlraw}/docs/PERF.md"
		"DEBUG-${pkgver}.md::${_ghurlraw}/docs/DEBUG.md"
		"THEME-${pkgver}.md::${_ghurlraw}/docs/THEME.md"
		"DIFF_VIEWER-${pkgver}.md::${_ghurlraw}/docs/DIFF_VIEWER.md"
		"DIFF_PREVIEWS-${pkgver}.md::${_ghurlraw}/docs/DIFF_PREVIEWS.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('ada39b6fcd5ff630d02ab5b802a0000cc688ef6c1f1e05778e363db63d1df4a3'
            'd6b9d96e8617a668be3dfbfc47f15c32a0c9dc590f69ff357297067593f65d6f'
            'a60bcb8c2d484ef140693a9292ed92da23e093abf5770d4cd1abe1f5cb267dc0'
            '84e1c56bdc68ba9dde8804b20517d7adfad8ee596c7c4c187503db14d44b398c'
            'c74de961bbf3c2e7c0a1b9daaf79b996c34d78b6c7526046bde7d23f2ae81bc2'
            '21dfbe8da3741154e385193690f3b1cdf7c2736f9a975df05a20f412b9e21ee6'
            '213bf7c00a570d4f66b65d2992ddd513da06413d2ec74f0e7f0953cadc6338b0'
            '8602e5cd9ae0f9f14947e4588bac221f510909df37db466a2f41633694b02911')
sha256sums_x86_64=('507a51edceb9098b4fbd50ffed95795b808f16e64d8960b4967e3282c5b0e303')


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
