# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=muzomer
_gitname=shanti
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Create and manage Git worktrees in multiple repositories"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'openssl' 'zlib')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-linux-latest")
sha256sums=('b4bf0975fe6cf1a55f0d0bd1651324ff8ff2b9346317d4f0bfb2038750ca9c47'
            '85927af65f9f16f2531192205c54cfc6ea28d0cd4689163f634bdb4346e9e633')
sha256sums_x86_64=('2df63ad5ba54d52fe96a17fd7fc21783cfc8290abceea716000d16afdf27a7eb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
