# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.4.5
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.4.5.tar.gz")
sha512sums=('a6e40204fd99c41ff05ea884aa19655e1e040ae454e542f4fa3c5a9f572cd2bb483c185fcca1d9f28638bb1517b405ffe8b47b6e44711946cd0f243e326d10bb')

build() {
    cd "${pkgname}"
	make
}

check() {
    cd "${pkgname}"
    make tests
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}

