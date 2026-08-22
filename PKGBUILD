# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=timhartmann7
_gitname=omnyssh
_appname=omny
pkgname=${_gitname}-bin
pkgdesc="TUI SSH dashboard & server manager — manage all your servers from a single terminal window"

pkgver=1.1.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_gitname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('45959ad95dd4b1e26310b6f8fcf373c40740cc5e58c51149f65debdca95c4eeb'
            'c0004499a5a1e5b50c2953271bd448da1f707e34502e2f3298f5b9ff70d548ca')
sha256sums_x86_64=('00b4b0f9c2ddc015ecbec9823a0ca4c68b9e975136caa9fb739e55176d325b14')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
