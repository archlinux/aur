# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.3.1
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.3.1.tar.gz")
sha512sums=('73a262223ae5d82f05ea46a7221865ff81f4aa6e024fb4b8aadc7e8d013e87501ee7c55583527216678fa6609f8d68a4507c169f6983322befe6d5737a61b35e')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

