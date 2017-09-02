# Maintainer: Alessandro Menti <alessandro.menti@alessandromenti.it>
pkgname=whohas
pkgver=0.29.1
pkgrel=1
pkgdesc="Software package and repository meta-search"
arch=('any')
url="http://www.philippwesche.org/200811/whohas/intro.html"
license=('GPL')
depends=('perl-forks' 'perl-libwww')
source=("https://github.com/whohas/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/whohas/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
noextract=("$pkgname-$pkgver.tar.gz.asc")
sha256sums=('dbf2396838cb0f97726041213c04426b818d48cc510bd529faf30a8411682878'
            'SKIP')
validpgpkeys=('610B28B55CFCFE45EA1B563B3116BA5E9FFA69A3')

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
