# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=adsellor
_gitname=readmarks
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI RSS Reader and Bookmarker"

pkgver=0.2.1
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
sha256sums=('eb6258826319fa9f1cbed5666376e6ceb91eeac50c8eff75eedf27d8364783ef')
sha256sums_x86_64=('6a86820ddc1af6c340e0e23238a655c6d8ab538337003d4afa38d4d7eb578ab4')
sha256sums_aarch64=('a0e37594036a95c6bf440d2f4b9b87707f38ecae95db0774be33cf3d9400aed5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
