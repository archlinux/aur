pkgname=jumper
pkgver=1.2
pkgrel=1
pkgdesc="Accurate and fast files/directories' jumper"
arch=('any')
url="https://github.com/homerours/jumper"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/homerours/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da597d498bcd90ba034d3990a0a6b244baec2d7fdb6690e03302241813acb8fe')

build() {
	cd $pkgname-$pkgver
	make jumper
	make clean
}

package() {
	cd $pkgname-$pkgver
	mkdir -p "$pkgdir/usr/bin" 
    mv jumper "$pkgdir/usr/bin" 
}
