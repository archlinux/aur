# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.21
pkgrel=1
pkgdesc="Archiver with multimember lzip compression"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/lzip/tarlz.html"
license=('GPL2')
depends=('lzlib' 'gcc-libs')
source=(https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz)
sha512sums=('1ad671da7ee115762163af57aad69ec754753e68a99ef8c4f38e880ecbb75a5b021f38794390eabcdbef4963cbc0c0e2abe36011da4135baf2c21dc22f020f4a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
