# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgname=libopenaptx-git
_pkgname=libopenaptx
pkgver=0.1.0
pkgrel=1
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
sha512sums=('532756cd89160d78d62f2c9c2c911afad8aab46b211eaaa30a6eea5f0cf41ab70e7dcba355322757d4bef42af6bff966972fea706989501ec9202d32b3d8984b'
            'SKIP')
validpgpkeys=('B856B21074A8AE9B692B80858BF0C93D03E44352')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
