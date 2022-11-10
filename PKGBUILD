# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.1.6
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.1.6.tar.gz")
sha512sums=('62811d3643b9d39880137173360a6711034b44eb169953be460d3160ea4e6cb9b0a04c808a43be190aa2f6ba664b8d250eabeec0f84c3c4c4d8be93c4026a356')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

