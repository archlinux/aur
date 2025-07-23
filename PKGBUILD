# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=giovanni-iannaccone
pkgname=kfd
pkgver=1.0.0
pkgrel=1
pkgdesc="Generator of useful keys for developers"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-3.0')

provides=("${pkgname}")
makedepends=('gcc' 'make')
depends=('glibc')

source=("git+https://github.com/${_pkgauthor}/${pkgname}.git")
sha256sums=('SKIP')

build() {
	cd ${pkgname} || exit 1

	make
}

package() {
	cd ${srcdir}/${pkgname} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
