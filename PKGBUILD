# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ahkohd
_gitname=oyo
_appname=oy
pkgname=${_gitname}-bin
pkgdesc="A diff viewer that works two ways: step through changes or review a classic scrollable diff"

pkgver=0.1.46
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
            '6178372b1699f49ceac3a83abf9ed82f07aaf2cef7682e58cdcbb2db23602cdc'
            '8e8d39c61c686065347853063eee16a5969b78999f81507c2c8d644ac2cad4b6'
            '6a3476fa886d241ec2a08b6739b2f927b7cc071b4a160797aa7b51622fdaf7c9'
            'ec6ac087fa0b1328a204bf06cd45098f4ec1155898ef926986dc78ff737376c7'
            'a60bcb8c2d484ef140693a9292ed92da23e093abf5770d4cd1abe1f5cb267dc0'
            'b1318d2bc667e1eb1d75e84b3b42f50a94fce44d860f2ff00abd6559a6218468'
            'd81308529db4f60ab7b16e2c913c346808dc31c84b8e57ac602069e32e720b94')
sha256sums_x86_64=('aa3f53ed5464cb8dbba7d2821b6f24ef2d56eb1dbd6b6759b6f4135730460260')


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
