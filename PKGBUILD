# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Jay Tauron <jytrn@protonmail.com>

_appauthor=zquestz
_appname=s
pkgname=${_appname}-bin
pkgver=0.8.0
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
sha256sums=('e351c4a9b3528fbe6c481cf0dd81e3e4a2b222b20cd6f3107540c0209177f1b9')

package() {
	cd "${srcdir}/s-linux_amd64"

	install -Dm775 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
