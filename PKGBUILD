# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=aaravmaloo
pkgname=blob
pkgver=1.2.0
pkgrel=1
pkgdesc="A minimal note manager that stays out of your way"
arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('GPL-2.0-only')

makedepends=('make' 'gcc')
depends=('glibc' 'libgcc')

provides=("${pkgname}")

source=("${pkgname}-${pkgver}.tgz::https://github.com/${pkgauthor}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a342cbcb6eeffe9985513f6572b133017ab12b503519c7eab3c74815debc95d7')

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
