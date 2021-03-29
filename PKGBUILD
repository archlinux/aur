# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.3.2
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('7b733907f47b0396df70f2975c3653d91f61889ad5d7dd8de77d8c2a2739cf51')

build() {
	cd "$pkgname-$pkgver"
        qmake-qt5 -r PREFIX=/usr CONFIG+=release
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
