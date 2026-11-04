# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=ahkohd
_gitname=oyo
_appname=oy
pkgname=${_gitname}-bin
pkgdesc="A diff viewer that works two ways: step through changes or review a classic scrollable diff"

pkgver=0.1.64
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
		"AGENT-${pkgver}.md::${_ghurlraw}/docs/AGENT.md"
		"THEME-${pkgver}.md::${_ghurlraw}/docs/THEME.md"
		"DEBUG-${pkgver}.md::${_ghurlraw}/docs/DEBUG.md"
		"REVIEW-${pkgver}.md::${_ghurlraw}/docs/REVIEW.md"
		"CONFIG-${pkgver}.md::${_ghurlraw}/docs/CONFIG.md"
		"CONTROL-${pkgver}.md::${_ghurlraw}/docs/CONTROL.md"
		"MARKDOWN-${pkgver}.md::${_ghurlraw}/docs/MARKDOWN.md"
		"PROFILING-${pkgver}.md::${_ghurlraw}/docs/PROFILING.md"
		"DIFF_VIEWER-${pkgver}.md::${_ghurlraw}/docs/DIFF_VIEWER.md"
		"KEYBINDINGS-${pkgver}.md::${_ghurlraw}/docs/KEYBINDINGS.md"
		"REVIEW_HOOKS-${pkgver}.md::${_ghurlraw}/docs/REVIEW_HOOKS.md"
		"DIFF_PREVIEWS-${pkgver}.md::${_ghurlraw}/docs/DIFF_PREVIEWS.md"
		"DEMO_RECORDING-${pkgver}.md::${_ghurlraw}/docs/DEMO_RECORDING.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('ada39b6fcd5ff630d02ab5b802a0000cc688ef6c1f1e05778e363db63d1df4a3'
            '1fac1ad6f66d827c6109510b1cdb006bb9cb9961e3611a9fe24c7a0a5ce8fbc6'
            '8e8d39c61c686065347853063eee16a5969b78999f81507c2c8d644ac2cad4b6'
            '6ed82ffe33981d044646aeab005a74869049acfc3cb12f65a689e752b71dd32e'
            'ec6ac087fa0b1328a204bf06cd45098f4ec1155898ef926986dc78ff737376c7'
            '6a3476fa886d241ec2a08b6739b2f927b7cc071b4a160797aa7b51622fdaf7c9'
            'ee067e304a7cdcc0a52a47e9afadb8decc8e68c272c34a4b2a9487bbd1cb7286'
            '64f6d93ecdeba5d27cbcf5e1c1f95e92f164b3655ac7ae340444e4ef8c445ddc'
            '5468cb844c9ee70fdf2506a9df700c86e7ec960dfbf18e5f59ecf14f8128a72a'
            'd21b588b43d757e3d442de40f0d183aa7f6e94202973c5bd4d10c38154599866'
            'a60bcb8c2d484ef140693a9292ed92da23e093abf5770d4cd1abe1f5cb267dc0'
            'b1318d2bc667e1eb1d75e84b3b42f50a94fce44d860f2ff00abd6559a6218468'
            '7edb47b14d780c1c4898b60013f07704f6958b2dc1fb4fa26b85ab47099a4ba0'
            'e87471d7c2944cfe49c9e1254ac14fe8fc1dda5826b079d3a488c53dd314918b'
            'd81308529db4f60ab7b16e2c913c346808dc31c84b8e57ac602069e32e720b94'
            '2f10208524d1fe121283259377cad67b846a4ddde30a513968a355e468dde978')
sha256sums_x86_64=('5c6d61c217ad4f86e6eb0e39e6a992fd2c3321847f6dba4dd258ee878babdff8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "PERF-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERF.md"
	install -Dm644 "AGENT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENT.md"
	install -Dm644 "THEME-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/THEME.md"
	install -Dm644 "DEBUG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DEBUG.md"
	install -Dm644 "REVIEW-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/REVIEW.md"
	install -Dm644 "CONFIG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIG.md"
	install -Dm644 "CONTROL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTROL.md"
	install -Dm644 "MARKDOWN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/MARKDOWN.md"
	install -Dm644 "PROFILING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PROFILING.md"
	install -Dm644 "DIFF_VIEWER-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DIFF_VIEWER.md"
	install -Dm644 "KEYBINDINGS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/KEYBINDINGS.md"
	install -Dm644 "REVIEW_HOOKS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/REVIEW_HOOKS.md"
	install -Dm644 "DIFF_PREVIEWS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DIFF_PREVIEWS.md"
	install -Dm644 "DEMO_RECORDING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DEMO_RECORDING.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
