# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=gdash
pkgver=20180129unstable
pkgrel=1
pkgdesc="A Boulder Dash clone, intended to be as close to the original as possible."
arch=("i686" "x86_64")
url="https://bitbucket.org/czirkoszoltan/gdash"
license=('MIT')
depends=("sdl2" "gtk2" "sdl2_image" "sdl2_mixer")
source=("https://bitbucket.org/czirkoszoltan/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=("7d4bc188d26b6cfce2c94c17dada22282a7108482c5a0f87d37f6ac6db76298e")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-gtk --with-sdl --enable-sound || return 1
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
