# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=chojs23
_gitname=lazyagent
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="See what your ai agents are doing"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('aa5a25f3cff85af24c23fe54a96584fd99a2d8480332fea39831dc794d824d32')
sha256sums_aarch64=('e9d3d89035f741bf6286443a54aafa065b7b0bf91debb2b3f2db865a8da4abd8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
