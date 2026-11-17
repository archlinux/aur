# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=am2rican5
_gitname=sigye
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A beautiful terminal clock with ASCII art fonts"

pkgver=0.7.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

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
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('2079e1f6e823cedd33ec9575b99820150e759a354964c815041c8ee96741a320'
            '679f179395bbc24603397c0676553b4ffc57aa64eea701d565a3b8421fc13a1b')
sha256sums_x86_64=('1e5dd69d63283e849a24370a93acd92c8f1622f07e300312d4a2afe246ce4557')
sha256sums_aarch64=('08de28e43a07ad26b38a30eda70eba4a4aec38ffee0165302821a9aa12ecab55')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
