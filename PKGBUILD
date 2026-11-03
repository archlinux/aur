# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=adsellor
_gitname=readmarks
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI RSS Reader and Bookmarker"

pkgver=0.3.0
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
sha256sums=('9de09d33653b093f9a018c0a0fa084cbfcb8d5b82c6a41bc43c30fcec979f4ee')
sha256sums_x86_64=('d153e1e86bb33ec251781ee5b9760fde37cff5691cf5786e0d01bf1e39f2d018')
sha256sums_aarch64=('909cd9ae29b42b4cc9629f28af3bcf1af971aab1c56400fe7dc4bf93c88e0c47')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
