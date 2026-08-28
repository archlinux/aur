# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=p-arndt
_gitname=hop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Hop from server to server without ever leaving your terminal."

pkgver=0.12.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('71d3244cf1b68e0d9a3a4bd5c33f9671b9f0b8a960134b64a27f7759ecea11cd')
sha256sums_x86_64=('c44533102214466df61229fea46c267ec32fb2ee36714c77ef94e5a494f0fda6')
sha256sums_aarch64=('01edbb9c9a4580208b9b5512659fb017d543be74459296175761df529a70ed55')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
