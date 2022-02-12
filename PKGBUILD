# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=1.0.6_r3
pkgrel=1
pkgdesc="A versatile graphical DSL and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
makedepends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
changelog=changelog
provides=(guish)
conflicts=(guish)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/1.0.6-r3.tar.gz")
sha512sums=('aab66d293d4878a253dabf7808c719253200a013a129a5408072daced8bdc48732f30cefee52a6de6159511cc6555c0910719bd7abd340f4ef534f644cd9cc10')

build() {
	cd "$pkgname"
	./configure --prefix=/usr --enable-webkit --enable-editor
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
