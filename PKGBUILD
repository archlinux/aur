# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgname=libopenaptx-git
_pkgname=libopenaptx
pkgver=0.0.0
pkgrel=2
pkgdesc="Open Source implementation of Audio Processing Technology codec (aptX)"
arch=('x86_64')
url="https://github.com/pali/libopenaptx"
license=('LGPL 2.1')
depends=()
makedepends=('git')
provides=('libopenaptx')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/pali/libopenaptx/releases/download/$pkgver/libopenaptx-$pkgver.tar.gz"{,.asc})
md5sums=('SKIP' 'SKIP')
validpgpkeys=('B856B21074A8AE9B692B80858BF0C93D03E44352')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
        mv "$pkgdir"/usr/local/* "$pkgdir"/usr/
        rm -rf "$pkgdir/usr/local/"
}
