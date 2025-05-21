# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=eqonomize
pkgver=1.5.10
pkgrel=1
pkgdesc='Efficient and easy accounting for the small household economy'
arch=('x86_64')
url='https://eqonomize.github.io/'
depends=('qt6-charts' 'qt6-base')
source=("https://github.com/Eqonomize/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9400ef561492ec292b298eba04f2557df2f08f151c17640779236b8a1a6f72f0')



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
