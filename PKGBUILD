# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.1.3
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.1.3.tar.gz")
sha512sums=('ba9ad23fc4f770551912d57bfa90c0a69cabe9248d2b724f979005156963151e619bddfc4dccf98ee4c1300e7bc1817559ffb7cae6efb96d7333487b1efe4a70')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

