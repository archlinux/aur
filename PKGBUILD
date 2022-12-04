# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=2.3.0
pkgrel=1
pkgdesc="A language and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish"
license=('GPL3')
depends=('libx11' 'libxtst' 'imlib2')
makedepends=('git' 'libx11' 'libxtst' 'imlib2')
provides=(guish)
conflicts=(guish guish-git)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish/archive/2.3.0.tar.gz")
sha512sums=('4724cc78bff34c850dbfabec9c3f4aa85cc4689d2d2f29067a01193789685809ba05294ee8ac4d92009864ff60ee02d7a76b68e86165b85f3db8310be8b9cc81')

build() {
    cd "${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir/" install
}

