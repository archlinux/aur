# Contributor: Yurii Kolesnykov <yurikoles@gmail.com>

pkgname=dps8m
pkgver=3.1.0
pkgrel=1
pkgdesc='Simulator for the Multics dps-8/m mainframe'
arch=('x86_64')
url='http://ringzero.wikidot.com'
license=('ICU')
depends=('libuv')
makedepends=('clang')
source=("https://gitlab.com/dps8m/dps8m/-/archive/R${pkgver}/dps8m-R${pkgver}.tar.bz2")
sha256sums=('ec9dd499eb5a32be717d7ad3f8a8e34f12ff5a66a44aa1ebb4bf6cf17ad3b88c')

build() {
	cd "${pkgname}-R${pkgver}"
	make
}

package() {
	cd "${pkgname}-R${pkgver}"
	install -d 755 "${pkgdir}/usr/bin"
	make INSTALL_ROOT="${pkgdir}/usr" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
