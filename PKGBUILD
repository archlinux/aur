# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=remememe
_gitname=sortsort
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="CLI sorting algorithm visualizer"

pkgver=0.1.2
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('LicenseRef-UNLICENSE')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}")
sha256sums=('189a43dcfefe0dd716cde4952fff8df3d68c2523fb58dbab6b3f26c2bb7b3f99')
sha256sums_x86_64=('71cf8b3e9f71275c45b284eb93584a46ec5d5cd6fb39a2920d1b713b03aef55c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
