# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.2.2
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.2.2.tar.gz")
sha512sums=('ffa7e3b17366b4fc2bcacc4e944f7c2e9638c65a61437b381abbcc19ece0fddc77f6457ff892f3562df98815fa97500e40c062346479501ba09242e91ec3f8df')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

