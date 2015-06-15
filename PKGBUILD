# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=gdash
pkgver=20130427unstable
pkgrel=1
pkgdesc="A Boulder Dash clone, intended to be as close to the original as possible."
arch=("i686" "x86_64")
url=("https://bitbucket.org/czirkoszoltan/gdash")
license=('MIT')
depends=("sdl" "gtk2" "sdl_image" "sdl_mixer")
source=("https://bitbucket.org/czirkoszoltan/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=("9f92790fe2d1f41d78167da7b4f4fac2")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-gtk --with-sdl --enable-sound || return 1
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
