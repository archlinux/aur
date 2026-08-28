# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=JoaoOliveira889
_gitname=monostack
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="To manage a AWS via TUI"

pkgver=0.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('83510e2c7e33ae47cacc68c45bdc989ac536704a4c2964e0df7c555bcbb7c01d')
sha256sums_aarch64=('36233b5cbe03218d1b87959663de15dc4ba6af3faec4b43430f87c6a4a8a02f1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
