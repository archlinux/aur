# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.24
pkgrel=1
pkgdesc='Archiver with multimember lzip compression'
arch=('x86_64_v3' 'x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=(GPL2)
depends=(lzlib gcc-libs)
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz")
sha512sums=('8aa617ce016675b24c3286ca44afef2801f37b8f617f89665aedd20266fdde1bc8a0ad6293a70b788fb36ad1f5c761d3141c26ab7b4615c8625d72f11c680d5c')

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
