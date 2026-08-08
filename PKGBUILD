# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=hars-21
_gitname=reqsh
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Interactive, persistent shell for HTTP requests"

pkgver=0.3.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('8f31c874c0743e236c895b93532c4fa69598fd8b58c641e1d6a5aac806b1f3ae'
            '2d7124e8942793e458a12398becb960d5cc152e04b4e7b6977a1696c5e428f3c')
sha256sums_x86_64=('85b3bd2c3b81e376afcd009cec9c3ecc1f752d2ae27f6638c86a918c71f46d82')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
