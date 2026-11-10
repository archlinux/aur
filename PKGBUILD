# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.33
pkgrel=1
pkgdesc='Archiver with multimember lzip compression'
arch=('x86_64_v3' 'x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=('GPL-2.0-or-later')
depends=(lzlib gcc-libs)
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz")
sha512sums=('72b50c80364ee2e475e9a61626bee332fd9fbaef8deda304fa42865141df621dd8893f8d05a9f7098ebe6a74b00d9df3006048696f45edcdb28d03323eab8685')

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
