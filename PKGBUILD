# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praneeth-etta
_gitname=docksurf
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Live, keyboard-driven terminal UI for Docker"

pkgver=0.3.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc' 'zlib')
provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('04bde48e9358ecbee9f1636d3fcab0d5a451b1d5a5399de75290873e84595485'
            '2384b94ba562b2e6b68d7195a66ecabd5d97bf0daec825a4d1ee4b1d13d9c24f')
sha256sums_x86_64=('61db7b7ac678638411cbb5d78aa1f932a8bad2fb562446840a8a654a68cdfae3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
