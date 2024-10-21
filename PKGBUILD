pkgname=jumper
pkgver=1.0
pkgrel=1
pkgdesc="Accurate and fast files/directories' jumper"
arch=('any')
url="https://github.com/homerours/jumper"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/homerours/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('201a4b23c4dfc0906782b757385b23c1e4cdf66b7c901b87aef8507e726d79e9')

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
