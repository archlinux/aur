# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.30
pkgrel=1
pkgdesc='Archiver with multimember lzip compression'
arch=('x86_64_v3' 'x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=('GPL-2.0-or-later')
depends=(lzlib gcc-libs)
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz")
sha512sums=('4fa28eba4507792a8ef48e35470eb11cd1d815bc7b0f90c9abcef4da2f30c6812544b52c06dcea49d63e897d9ba2c4dc2e4448c4f6814212a1d7cd52ad6cba03')

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
