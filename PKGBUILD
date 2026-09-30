# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=nved
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A small REPL-flavored terminal text editor — print a range by line number, climb in, and edit in place."

pkgver=1.5.3
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
depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('0a0c7ffd231feaefec8e8ffc9f2ddfc0118abe7a0a18b7585497d24de5f60710')
sha256sums_aarch64=('ba8fad476c5b5f9ca83fe2726f582ec93278aa3866185ed477ef98d7de7dee69')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
