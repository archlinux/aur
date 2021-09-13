# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=cmdcalc
pkgver=2.4
pkgrel=1
pkgdesc="A simple command-line calculator"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/Benni3D/cmdcalc"
license=('GPL3')
depends=('readline>=8')
makedepends=('cmake')
source=("https://github.com/Benni3D/cmdcalc/archive/v${pkgver}.tar.gz")
md5sums=('e1e15fb03a24aa8ead244b8c04fe1042')

prepare() {
	install -dm 755 "${pkgname}-${pkgver}/build"
}

build() {
	cd "${pkgname}-${pkgver}/build"
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "build/cmdcalc2" "${pkgdir}/usr/bin/cmdcalc"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
   install -Dm644 "doc/man.1/cmdcalc.1" "${pkgdir}/usr/share/man/man1/cmdcalc.1"
}
