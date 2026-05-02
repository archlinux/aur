# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=luislve17
_gitname=scrollti
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Tiny tool to make stdout scroll"

pkgver=1.0
pkgrel=1
_gitversion=scrollti-v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('d0e2fe6826737f84c84fb8149a8c77a7461661ce56eef4f3aa71ec859aed7ef6')
sha256sums_x86_64=('eed6a735b55786a3fbda3171b9c6345f25277a536dd019a8784a6d399aabdb44')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
