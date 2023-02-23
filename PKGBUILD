# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.6.2
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.6.2.tar.gz")
sha512sums=('02304329c062f6c881154e89f566a563199a8b16e0e9300e62a476ec1dc773d41ff40315bed775362d263c20d7b1d3d49a8fc2e4e486f06bca8179a7611ce713')

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

