# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yagnikpt
_gitname=flashback
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A command-line knowledge store. It captures text, URLs, and commands, extracts structured metadata, and makes everything searchable."

pkgver=0.2.0
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
depends=('glibc' 'libgcc')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('133f8f2c9d0c7c0b17b99d6c32e06ef2dc42884b05e6f7a55e5346ac0f04bbe7')
sha256sums_aarch64=('d1932cc6e9250e2d3c293b3700d4c4fcf7d3f0eaa5fe94e9091d7cb0b679aef8')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
