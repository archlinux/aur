# Maintainer: Francesco Palumbo <phranz@subfc.net>

pkgname=guish
pkgver=1.0.7
pkgrel=1
pkgdesc="A versatile graphical DSL and army knife to make and modify GUIs."
arch=('x86_64')
url="https://codeberg.org/phranz/guish_old"
license=('GPL3')
depends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
makedepends=('libx11' 'qt5-base' 'qt5-webkit' 'libxtst')
changelog=changelog
provides=(guish)
conflicts=(guish)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/phranz/guish_old/archive/1.0.7.tar.gz")
sha512sums=('e3bb68fb57f977e1756e3ae344195fd590b23cf9b057b5a7a0a39724a38ce370f76dfacbf2890f5a3593b1bee46db6776b40b3bc894dceee0ae6ec2c9b568644')

build() {
	cd "$pkgname"
	./configure --prefix=/usr --enable-webkit --enable-editor
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
