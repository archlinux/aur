# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.6.1
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.6.1.tar.gz")
sha512sums=('96fb2b0ee7fa0b1781198d085064eaa03aba8c3c2d7d463b08935dd0d2e4fb5264863617b2d7a915221a20c345c367f75a08579ac8f848815d4434521c9d03ca')

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

