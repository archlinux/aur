# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.2.0
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('9ad10ccd1d318445b92bb80f59097402fc0dfd01fa428725bf9d8f88d1ed2bb3')

build() {
	cd "$pkgname-$pkgver"
        qmake-qt5 -r PREFIX=/usr CONFIG+=release
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
