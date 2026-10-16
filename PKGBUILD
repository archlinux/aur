# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=harryxu
_gitname=qrr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Turns complex commands into interactive recipes, with prompts for values and menus for options"

pkgver=0.1.1
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

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
sha256sums=('5e272495fc8db7531a39c081cc1a4f8d1d3542c8edd4d23116afbc6a28022978')
sha256sums_x86_64=('5d77deb7f67be331da2867fad1420e822c557579a3db007e9e13dbe2ddde13af')
sha256sums_aarch64=('2e6d0c8049cd7242b9d11fb28d24382e6519f18f48446e0f298c0109e8070bd8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
