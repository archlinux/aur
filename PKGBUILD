# Maintainer: Thomas Weißschuh <aur t-8ch de>
# Contributor: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgname=libopenaptx
pkgver=0.2.0
pkgrel=1
pkgdesc="Open Source implementation of Audio Processing Technology codec (aptX)"
arch=('x86_64')
url="https://github.com/pali/libopenaptx"
license=('LGPL2.1')
conflicts=('libopenaptx-git')
source=("https://github.com/pali/libopenaptx/releases/download/$pkgver/libopenaptx-$pkgver.tar.gz"{,.asc})
sha512sums=('90251af1fbf6430e447515e18f4815310d696bbb68b0aa00e008675efe622f44777623a5f3a880e57291e5a89485bf5613b61ef99e6c47c15b56fe057ad67d3d'
            'SKIP')
validpgpkeys=('B856B21074A8AE9B692B80858BF0C93D03E44352')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
