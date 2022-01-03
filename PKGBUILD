# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=eqonomize
pkgver=1.5.3
pkgrel=1
pkgdesc='Efficient and easy accounting for the small household economy'
arch=('x86_64')
url='https://eqonomize.github.io/'
depends=('qt5-charts' 'qt5-base')
source=("https://github.com/Eqonomize/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6184b42d1bd5cb54dcd450e2db184ba8b6096ecd839eb432ade08190e32cc6ee')



build() {
	cd "${pkgname}-${pkgver}"
	qmake PREFIX=/usr \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
}
