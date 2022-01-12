# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.22
pkgrel=1
pkgdesc='Archiver with multimember lzip compression'
arch=('i686' 'x86_64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=('GPL2')
depends=('lzlib' 'gcc-libs')
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz")
sha512sums=('4e241ea0571e421c93fbeeb54a20e73fd4a7e9c85dc3b24295caec1a52e156cdcf5e85f4ee41f5dfae712b851d17fe0e96955380bb86306d8002f4187d0c60ec')

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
