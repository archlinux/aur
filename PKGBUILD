# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=ClementNerma
_appname=Trasher
_execname=${_appname,,}
pkgname=${_execname}-bin
pkgver=4.4.1
pkgrel=1
pkgdesc=" A small command-line utility to replace 'rm' with a portable trash directory system"
arch=('x86_64' 'aarch64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('Apache-2.0')

depends=()
provides=("${_appname}")
conflicts=("${_appname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_execname}-${arch[0]}-unknown-linux-musl.tgz")
source_aarch64=("${pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_execname}-${arch[0]}-unknown-linux-musl.tgz")
sha256sums=('212b77d4230f46c59c30453b714045274d85ee91c313161ee72dad2617d46c79')
sha256sums_x86_64=('09248aa9fb1ca593b6773baa9b9aa52c2e02495226f18c630e3eb88cded5c5b5')
sha256sums_aarch64=('09248aa9fb1ca593b6773baa9b9aa52c2e02495226f18c630e3eb88cded5c5b5')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
