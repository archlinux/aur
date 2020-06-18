# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
pkgname=dps8m
pkgver=2.0
pkgrel=2
pkgdesc='Simulator for the Multics dps-8/m mainframe'
arch=('x86_64')
url='http://ringzero.wikidot.com'
license=('ICU')
depends=('libuv')
makedepends=('clang')
conflicts=('dps8m-git')
source=("https://gitlab.com/dps8m/dps8m/-/archive/R${pkgver}/dps8m-R${pkgver}.tar.bz2")
sha256sums=('bacb7b671579a8cff0a1eaa43b87cbb2e6377da6bec2c8ef295b49c32b609e2a')

build() {
	cd "${pkgname}-R${pkgver}"
	make
}

package() {
	cd "${pkgname}-R${pkgver}"
	install -d 755 "${pkgdir}/usr/bin"
	make INSTALL_ROOT="${pkgdir}/usr" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
