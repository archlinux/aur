# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.2.6
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.2.6.tar.gz")
sha512sums=('77f519afa2e1a855362e22a53f8d20978940bdd3f6bf0540ff767e725f6a7a395bd82e54cf0ea94edc0cfdfbc631f5d866b66be1c5113f14c14b16d26172df78')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

