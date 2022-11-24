# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.2.3
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.2.3.tar.gz")
sha512sums=('d332ba73e22718925595567e5dc131298abada1a895300c32b8011bd13e3216d21065f9a452d374c835656a9639c24be01def6ed984cdf9d03826f43d3fdfa74')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

