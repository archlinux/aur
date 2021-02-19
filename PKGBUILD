# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.2.1
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('f644a5999d2b2ed6de21ff7fb4d04652f8bfca0a4e7efc2a2b85cf4973774958')

build() {
	cd "$pkgname-$pkgver"
        qmake-qt5 -r PREFIX=/usr CONFIG+=release
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
