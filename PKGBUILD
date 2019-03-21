# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='folding'
pkgdesc='Combined instrumentation and sampling for instantaneous metric evolution with low overhead (from BSC).'
pkgver='1.3.2'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('GPLv3')
depends=(boost qt5-base libbsctools)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(df54700a1eee506f7b7b8d08f74805d576d1455fe3e31de368d0a98bd3bc7114eef4c32d73462ac9cab2f5a9f273c27cc8538e9cfbf9b044c8ef66d3881a7f3d)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure \
		--prefix=/usr \
		--with-libbsctools=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make prefix="$pkgdir/usr/" install
}