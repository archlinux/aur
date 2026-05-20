# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=timhartmann7
_gitname=omnyssh
_appname=omny
pkgname=${_gitname}-bin
pkgdesc="TUI SSH dashboard & server manager — manage all your servers from a single terminal window"

pkgver=1.0.2
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
sha256sums=('4316319551ad8ab99795b7efa5ec7f206c7516bd36ec5b0d8644d72fc54f4e3b'
            'c0004499a5a1e5b50c2953271bd448da1f707e34502e2f3298f5b9ff70d548ca')
sha256sums_x86_64=('dddfbb8e19826e1e63d84f29ac4cb4b1b1f50fd1bf15bd1e8cb1cc8f21f108f4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
