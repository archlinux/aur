pkgname="xpilot-ng"
pkgver=4.7.3
pkgrel=1
pkgdesc="A multi-player 2D spacewar game"
arch=('x86_64')
url="http://xpilot.sourceforge.net/"
license=('GPL2')
depends=('sdl_ttf' 'sdl_image' 'glu' 'libxxf86misc')
optdepends=('openal' 'freealut')
makedepends=('gcc')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f287093c757a71232000f210ee4a4edeccc9e8af0817d5be43084e84aebd4709')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=$pkgdir/usr
	make
}

package() {
	cd $pkgname-$pkgver
	mkdir -p $pkgdir/usr
	make install
}
