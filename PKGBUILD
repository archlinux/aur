# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=gemmi
pkgver=0.6.2
pkgrel=1
pkgdesc="Macromolecular crystallography library and utilities"
arch=('x86_64')
url="https://project-gemmi.github.io"
license=('MPL2')
depends=('python')
makedepends=('gcc-fortran')
source=("https://github.com/project-gemmi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d225548ddf4289d7adb9a0cce725cf4853474b9903399080f4770c77d4c18929')

prepare() {
	cd "$pkgname-$pkgver"
	# cmake -D USE_FORTRAN=1 -D USE_PYTHON=1 -D CMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$pkgname-$pkgver"
	# make
}

package() {
  # Prepare the directory structure.
  install -dm755 "${pkgdir}/usr"

  cp -r "${srcdir}/${pkgname}-${pkgver}/include"  "${pkgdir}/usr/"
}

