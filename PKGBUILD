# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=aaravmaloo
pkgname=blob
pkgver=1.3.0
pkgrel=1
pkgdesc="A minimal note manager that stays out of your way"
arch=('x86_64')
url="https://github.com/${pkgauthor}/${pkgname}"
license=('GPL-2.0-only')

makedepends=('make' 'gcc')
depends=('glibc' 'libgcc')

provides=("${pkgname}")

source=("${pkgname}-${pkgver}.tgz::https://github.com/${pkgauthor}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('971a323dbfa15b60ac047fe0301e0114ed4afe8be0fe6819bd123ab151669200')

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
