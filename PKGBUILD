# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.1.0
pkgrel=1
pkgdesc="A versatile graphical DSL and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.1.0.tar.gz")
sha512sums=('067908b3e8a3c8081c3bf8b90f7c23b21ae587a3915091ce9d34b38c9a0260ada98a3339c01efa45afb31936f9eb6360e7968008e0ca3bb6fd6cb8ca8bbf56e8')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

