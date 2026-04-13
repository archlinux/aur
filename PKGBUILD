# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: David Birks <david@birks.dev>

_gitauthor=matheus-git
_gitname=binkit
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modular toolbox for analyzing, disassembling, and patching binary formats"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('d90c1cf3891632227d053cbba62385cd3f3d3626e5db02da154b37396a208774'
            '580ee551bd40bafa3f22e6da8a60e586cec0b36f2c39508b4e03aa8b2a463845')
sha256sums_x86_64=('e19f9f8bbf129cb8d206ef7b9eb418027c2292577793928f07635cca329553e3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
