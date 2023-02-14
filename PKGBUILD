# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=gemmi
pkgver=0.5.8
pkgrel=1
pkgdesc="Macromolecular crystallography library and utilities"
arch=('x86_64')
url="https://project-gemmi.github.io"
license=('MPL2')
depends=('python')
makedepends=('gcc-fortran')
source=("https://github.com/project-gemmi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b67c8f79d85c4fd6766ce5b0418c79f4cb54a62d9091de6d0a7c20bb6060070e')

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

