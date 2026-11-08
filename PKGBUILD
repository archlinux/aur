# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=adsellor
_gitname=readmarks
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI RSS Reader and Bookmarker"

pkgver=0.3.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('ded6537c1e401a8316ab891b179aaeec5e8579869a2ad2a0061ae51fd3904292')
sha256sums_x86_64=('912dfaecf4b8df9773e6e908093e519fd6336af66c69c51a4fa4e03d13af1ba3')
sha256sums_aarch64=('5f7767941f28b170e3ed4f892e47233570b50a4c5c0cbea29e2e7efff4d1406d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
