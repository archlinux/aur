# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Jay Tauron <jytrn@protonmail.com>

_appauthor=zquestz
_appname=s
pkgname=${_appname}-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="https://github.com/${_appauthor}/${_appname}"
license=('MIT')
options=('!strip' '!emptydirs')

provides=("${_appname}")
depends=('glibc')
makedepends=()

source=("${pkgname}_${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}-linux_amd64.zip")
sha256sums=('3ad89de54506283ed889d9930e9284832f5d6d6d62be255859c07a1d4f5cbbee')

package() {
	cd "${srcdir}/s-linux_amd64"

	install -Dm775 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
