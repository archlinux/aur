# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=omgtehlion
_gitname=jzero
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A command-line JSON viewer that can handle gigabytes of JSON data"

pkgver=0.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('cccb5ab6fbf787f6d2a671dd13407ec131110ddda0a868b4e26b0384c3b6d064'
            '53e42b58a80e9c14ccad2ac394952827ff2b08849688e09ea2dbdb506377ee67')
sha256sums_x86_64=('a827ebd86f74647273f5565594e47645e71a66953e3e0939e97c3504cd5d181b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
