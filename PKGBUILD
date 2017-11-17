# Maintainer: Patrick Lühne <patrick-arch@luehne.de>
pkgname=plasp
pkgver=3.1.0
pkgrel=1
pkgdesc='ASP planning tools for PDDL'
arch=('x86_64' 'i686')
url='https://github.com/potassco/plasp'
license=('MIT')
makedepends=('cmake')
source=("https://github.com/potassco/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
sha512sums=('80fbe86bde9490d064f28ab60c7b0782568fe2356df6e24607b2342df453902161638070f14a721a0efbe6f34d2f1cdb7204dbba2c98408abf39642c24eb3c89')

build() {
	cd ${pkgname}-${pkgver}
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -D build/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m644 README.md -t ${pkgdir}/usr/share/doc/${pkgname}
	install -D -m644 LICENSE.md -t ${pkgdir}/usr/share/licenses/${pkgname}
}
