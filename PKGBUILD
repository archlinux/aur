# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=rep
_pkgauthor=baalimago
_pkgname=repeater
pkgname=${_appname}-bin
pkgdesc="xargs, but different..! Better at some things (repeating stuff), worse at others (not repeating stuff)."

pkgver=1.2.7
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux-amd64' 'linux-386' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}_${_pkgvername}")
source_i686=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}_${_pkgvername}")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[2]}_${_pkgvername}")
sha256sums=('facb2fb0e6e0e70bd7ea37899636c072cf59cf43f90adee55cf07a83fbd42324'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('8dd45b5ffb503dbe422bbeaed25df981a6627ad2b93257df926fbc75359af4e9')
sha256sums_i686=('85d11cb6fe9c9eeb6a0c0ef4c9f3dbb109ac0aa7eae2d444c5c5a77e9e82a95e')
sha256sums_aarch64=('9b5ddd0a82791dd087136947da1a57d7fdbe8f2257c7f98cea843722020a21b3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
