# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=adsellor
_gitname=readmarks
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI RSS Reader and Bookmarker"

pkgver=0.2.0
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
sha256sums=('d8dce5033228a4642e30838e58bcfc5bcb59723d03162bb5ffc32004cbfb5a7d')
sha256sums_x86_64=('cc437d7c4d12d0b9e4a036278d9fd47c9469baa0ce0503af03db3bd6cff8edc0')
sha256sums_aarch64=('96f8aae352b4ad11fb69430676f74b8b1959e2b5366d294a513539e7d337dda5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
