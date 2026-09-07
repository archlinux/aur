# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=bspeelm
_gitname=bothy
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A turn-key terminal workspace built from tools you already trust"

pkgver=0.11.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('ab6fb4a748e59670a7dbcb41b4e3d2326dfa692b94f2d67c578b536901d8b5bb')
sha256sums_aarch64=('06a6177f1de1f3a98a77a070446563b03ca9b7ea79684dc6556ea6ae02a51f57')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
