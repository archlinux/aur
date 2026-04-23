# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Katie Wolfe <katie@dnaf.moe>

pkgname=tarlz
pkgver=0.29
pkgrel=1
pkgdesc='Archiver with multimember lzip compression'
arch=('x86_64_v3' 'x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://www.nongnu.org/lzip/tarlz.html'
license=('GPL-2.0-or-later')
depends=(lzlib gcc-libs)
source=("https://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.lz")
sha512sums=('18e575abc2cc02201a0da3ea404ca4db62a3d8a3109e1de3e4ece43dfb9f08b8b7b0dc1083d1effac1b64408d6b93498cc75d04f14cf721d3eb16864af7f2504')

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
