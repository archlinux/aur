# Maintainer: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=sombok
pkgver=2.3.1
pkgrel=1
pkgdesc='Line breaking (line folding) library respecting Unicode'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/linefold/'
license=('PerlArtistic' 'GPL2')
source=(https://downloads.sourceforge.net/project/linefold/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c22465f4e08ed2b5dd3e144a6a607a5c')
depends=('libthai')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --enable-libthai --disable-doc
	make
}

check() {
	cd $pkgname-$pkgver
	make check
}

package() {
	cd $pkgname-$pkgver
	make -j1 DESTDIR="$pkgdir" install
}
