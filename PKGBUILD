# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.1.5
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.1.5.tar.gz")
sha512sums=('5d06627e7625bb2ce4227540313ea6728a0e3b3aaf2364a216d7c3c9e8031a9c68e9a3ac508da8239ca34f7321f46209c678b02abf987e8ea3b5830d85be2daf')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

