# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=aaravmaloo
pkgname=blob
pkgver=1.1.1
pkgrel=1
pkgdesc="A minimal note manager that stays out of your way"
arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('Apache-2.0')

makedepends=('make' 'gcc')
depends=('glibc' 'libgcc')

provides=("${pkgname}")

source=("${pkgname}-${pkgver}.tgz::https://github.com/${pkgauthor}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f53f9cd545d1d740d002bbc1291d6bf4882bf4d89afd613275a07de7762bf82f')

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	make release
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
