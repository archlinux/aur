# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=1.0.6_r1
pkgrel=1
pkgdesc="A versatile graphical DSL and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
makedepends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
provides=(guish)
conflicts=(guish)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/1.0.6-r1.tar.gz")
sha512sums=('e04046a75a5e57fdb3360335cb61d5d244d0dc80439e17dd46d6fde069790e64b28132d4ff125ee0d6411ce86490b3689c93601620f084f5c5b4bf02ef2be937')

build() {
	cd "$pkgname"
	./configure --prefix=/usr --enable-webkit --enable-editor
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
