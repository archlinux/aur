# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=adsellor
_gitname=readmarks
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI RSS Reader and Bookmarker"

pkgver=0.2.2
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
sha256sums=('4189cff906f122e283022a8f37d451be8147c2c4073d9518d6ee737094196aba')
sha256sums_x86_64=('5bdc1218d2f5e0c5820c679616d926ec615fdf36a7959e7956e6ba7fda0c97f6')
sha256sums_aarch64=('a1040c954c48b7478c4fe58f3b53648473e266cc47159eb6453ed757ea483ac2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
