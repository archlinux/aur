# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.3.2
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.3.2.tar.gz")
sha512sums=('0cdac41d40c4a98f8a25f7138b355b028f0bc7128bdb9eae159244574d0528827b7331f39b2ffbf4d22fb0f4c51a83a7b594707c83ce812a9fb9311e39c6c1db')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

