# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=svetovid-lib
pkgver=0.5.0
_commit=b7c003f8b277ed19be23b674c656b73b262e5769
pkgrel=1
pkgdesc='Supplement Library for Introductory Programming Courses'
arch=(any)
url='https://github.com/ivanpribela/svetovid-lib'
license=('APACHE')
depends=('java-runtime')
makedepends=('ant')
source=("git+https://github.com/ivanpribela/svetovid-lib#commit=${_commit}")
sha512sums=('SKIP')

build() {
	cd "${pkgname}"

	ant pack.jar
}

package() {
	cd "${pkgname}"

	install -Dm644 "dist/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
