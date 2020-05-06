# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Pradana Aumars <paumars@protonmail.com>

pkgname=classicladder
pkgver=0.9.113
pkgrel=1
epoch=
pkgdesc="An open source project to have a free ladder and sequential (grafcet) programming software coded in C language (to be used for educational, training, in Software PLC on PC computers or embedded platforms, ...)"
arch=('x86_64')
url="https://sourceforge.net/projects/classicladder/"
license=('LGPL3')
makedepends=(pkgconf gtk2)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver.tar.gz/download")
sha512sums=('876070c40886ee324e9dbb9a1ecd885f58a38260abee24124d1c67fa48b55d4d43fdd486b91aaf71c2eb7da3db41bfca5a5cfc4f3861211cf13a4580d52c0751')

build() {
	cd "$pkgname"/src
	make
}

package() {
	cd "$pkgname"
	install -D -m755 $pkgname "${pkgdir}/usr/bin/$pkgname"
}
