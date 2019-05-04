# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=eqonomize
pkgver=1.3.4
pkgrel=1
pkgdesc='Efficient and easy accounting for the small household economy'
arch=('x86_64')
url='https://eqonomize.github.io/'
depends=('qt5-charts' 'qt5-base')
source=("https://github.com/Eqonomize/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('2b7a1b9f4375790f26da2ec614260b45f95ec9a9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
    qmake PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
