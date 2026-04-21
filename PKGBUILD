# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=chuma-beep
_gitname=typist
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cross-platform CLI and Web UI typing application built for developers to master speed and syntax"

pkgver=2.0.1
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

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('be65f82e6e7c9ab0e0c161fe9bc397195a1d372ff7bf795b0834cdb6d5de9408')
sha256sums_aarch64=('50225d95cf1cd0ad2f2b23e23aada0b4c4a99b07af2a7a85d3296920e29152e8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
