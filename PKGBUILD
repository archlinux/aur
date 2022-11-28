# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.2.4
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.2.4.tar.gz")
sha512sums=('3649d4e3f23e097fdb7ef21bde4aa32a55c7d7628e7634ae183b5e6f2c121a4d80050302bcc1f937c1b01f2d938c0c46c437596941bfa2925b06a8df748a646e')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

