# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=isene
_gitname=rush
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast terminal shell written in Rust"

pkgver=0.1.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlicense')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

install="${_appname}.install"

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('a7c7583d9a641a30f94eb00a173a50ff1416f68ae8d785f9ba318de466d5a37f')
sha256sums_x86_64=('9b80382fb892ce157823d62b9c7d6f6ab1c9a2721b0880e9433245adf0fb67b3')
sha256sums_aarch64=('307127422495f24f16cbfc1a9a9380a1d5f8c92929372bf93dadddbff8a04ce8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
