# Maintainer: Ahmmed Sakib Noman <nomanahmmed0@gmail.com>

pkgname=perltidy
pkgver=20250105.02
pkgrel=1
pkgdesc='A tool to indent and reformat scripts written in Perl'
arch=('any')
url='https://perltidy.sourceforge.net/'
license=('GPL-2.0')
depends=('perl>=5.35.0')
makedepends=('perl>=5.35.0')
optdepends=()
checkdepends=(perltidy)
provides=('perltidy')
conflicts=('perltidy')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/perltidy/perltidy/tar.gz/refs/tags/$pkgver")
sha512sums=('034252656872dbe0dce6cbf2b37b2ca371666b352408acd03094d4e66ceb7de28bc58726ac10e39d65b12d9022b6aa51e7e91ba2d7d2c5817a523b7b1a9a4267')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	perl Makefile.PL
	make VERSION=$pkgver DESTDIR="$pkgdir"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make VERSION=$pkgver DESTDIR="$pkgdir"
	make VERSION=$pkgver DESTDIR="$pkgdir" install
}
