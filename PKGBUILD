# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.1.1
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.1.1.tar.gz")
sha512sums=('816bb61b44efe5c8beb77842df86f6b9c52c247a6b4955418eb26cfc92804a8184f0deff97702068ae8f50a57edf11c7b4d520f8dbe120b51e1d34c614bc0f1b')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

