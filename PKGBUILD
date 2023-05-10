# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=gemmi
pkgver=0.6.1
pkgrel=1
pkgdesc="Macromolecular crystallography library and utilities"
arch=('x86_64')
url="https://project-gemmi.github.io"
license=('MPL2')
depends=('python')
makedepends=('gcc-fortran')
source=("https://github.com/project-gemmi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc1d7397ee77e94584c061a45a7d577128e794398efa6868a369ffec924f7bea')

prepare() {
	cd "$pkgname-$pkgver"
	cmake -D USE_FORTRAN=1 -D USE_PYTHON=1 -D CMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

