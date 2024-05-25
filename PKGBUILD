# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=eqonomize
pkgver=1.5.7
pkgrel=1
pkgdesc='Efficient and easy accounting for the small household economy'
arch=('x86_64')
url='https://eqonomize.github.io/'
depends=('qt6-charts' 'qt6-base')
source=("https://github.com/Eqonomize/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('90c730eeac3bafc15a8db2b4bc1867eecaf18b1828bcc059a58c8f22ab22dabc')



build() {
	cd "${pkgname}-${pkgver}"
	qmake6 PREFIX=/usr \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS="${LDFLAGS}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
}
