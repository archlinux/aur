# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.28.1
pkgrel=1
pkgdesc='Archiver with multimember lzip compression'
arch=('x86_64_v3' 'x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=('GPL-2.0-or-later')
depends=(lzlib gcc-libs)
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz")
sha512sums=('344ca4629b3868f525d08c67af1a0e394151b9263473a39fbc380ed4baef15a2feb6e8661ef88bf16e59623fbe70eadb1e36e7cd522ceee9956016c4edc5f30a')

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
