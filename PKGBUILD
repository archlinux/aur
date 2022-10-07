# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.23
pkgrel=2
pkgdesc='Archiver with multimember lzip compression'
arch=(i686 x86_64)
url='https://www.nongnu.org/lzip/tarlz.html'
license=(GPL2)
depends=(lzlib gcc-libs)
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz")
sha512sums=(623407142d03e0ddae3dbb057b8ef5f1aea850418dbb47c6278affa42c88bc1786cd3249d1e8c018643f41516787225cb2ed3aca2fc02ba8e65dfe4744f965d8)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make check
#}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
