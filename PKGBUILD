# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=normen
_gitname=whatscli
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A command line interface for WhatsApp, based on go-whatsmeow and tview"

pkgver=1.1.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-linux.zip")
sha256sums=('e2a07cedb83664a7f2376e07c83c2d9d3ed961d815b00ee228cf63fd34206def')
sha256sums_x86_64=('1865abf0f540327d8afcc1cb039456e9eee19cc504e28f0c73f327ce1da260c0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
