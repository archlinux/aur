# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=juanibiapina
_gitname=mcpli
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A command-line interface for interacting with MCP servers"

pkgver=1.3.1
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
sha256sums_x86_64=('71a73bee681188bfd709ef5182b46df94c06f45d64c1fecd206c9c493c23224d')
sha256sums_aarch64=('79461b96b1e6ea8e62842b6d81bbc3dfd9031ad85a9623179c266f52b864715c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
