# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.2.2
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('eaaf24a1e2a44298045b692b2731181bbfb51d57ca00d7d056c165479407a993')

build() {
	cd "$pkgname-$pkgver"
        qmake-qt5 -r PREFIX=/usr CONFIG+=release
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
