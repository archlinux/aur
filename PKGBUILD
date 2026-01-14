# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AngelJumbo
_pkgname=vitals
pkgname=${_pkgname}
pkgdesc="CLI system usage visualizer for Linux"

pkgver=0.1.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")

makedepends=('make' 'gcc')
depends=('glibc')

source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/refs/tags/${_pkgvername}.tar.gz")
sha256sums=('89e996e9d1b52619b1884cd33e1387f1f7c75766433b21652aaa5bcc173e26d5')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

