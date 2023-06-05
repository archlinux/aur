pkgname=vstar-aavso
pkgver=2.22.0
pkgrel=1
pkgdesc="VStar is a multi-platform, easy-to-use variable star data visualization and analysis tool that was originally developed as part of the AAVSOs Citizen Sky project."
arch=('any')
url="https://www.aavso.org/vstar"
makedepends=('ant')
depends=('java-environment-common')
license=('AGPL3')
source=("https://github.com/AAVSO/VStar/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('12d2a1bd9b8a620090139c7658a079b38816730408cb86d9fc956ba817b11473')


build() {
	cd "${srcdir}/VStar-${pkgver}"
	ant compile_src
	ant dist
}

package() {
	mkdir -p "$pkgdir/opt/${pkgname}"
	cp -r "${srcdir}/VStar-${pkgver}/" "$pkgdir/opt/${pkgname}/"
}
