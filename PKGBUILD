# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.3.1
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('608b6e3917ddae7481271a09ec8cf1bb0fe6e6938183a9975cdb1eda761e7ab7')

build() {
	cd "$pkgname-$pkgver"
        qmake-qt5 -r PREFIX=/usr CONFIG+=release
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
