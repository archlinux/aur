# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Pratyay360
_gitname=ensor
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast, interactive CLI for finding and redacting secrets in your codebase"

pkgver=0.4.8
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('5e3a17bca32b3b6aa491f5fdd3c819e6e391c06d63b3eadc2f9700f867d51dd1')
sha256sums_i686=('951b676f66a215ef04514e7110d007e79c16af23a6bc7c72b03c70b77a309f7f')
sha256sums_aarch64=('267b792252ae9faca5e15d8d3365839cb19096f2b7b080a092a51ebe081da3e4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
