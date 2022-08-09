# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=1.0.7
pkgrel=1
pkgdesc="A versatile graphical DSL and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish_old"
license=('GPL3')
depends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
makedepends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
changelog=changelog
provides=(guish)
conflicts=(guish)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish_old/archive/1.0.7.tar.gz")
sha512sums=('cf5f0fb55e74b7b5c1cfb7d0f4b76cd0a3e35d4ac80f48cc6d7d85c6326fa8b8a203c3ef0c0384ae1a38383f9932f2d1f47faffae330f239ce147306d1c66cd8')

build() {
    cd "${pkgname}_old"
	./configure --prefix=/usr --enable-webkit --enable-editor
	make
}

package() {
	cd "${pkgname}_old"
	make DESTDIR="$pkgdir/" install
}

