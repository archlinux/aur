# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=3.0.1
pkgrel=2
pkgdesc="Fork of the GNU oleo lightweight spreadsheet"
arch=('i686' 'x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
optdepends=('xbae')
source=("https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('802229a004de2c4a4b0efea78355f655')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
