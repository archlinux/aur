# Maintainer: Christian <0x2a@posteo.org>
pkgname=geomandel
pkgver=0.3.1
pkgrel=1
epoch=
pkgdesc="Fast mandelbrot fractal generator written in C++"
arch=('i686' 'x86_64')
url="https://github.com/crapp/geomandel"
license=('GPL')
groups=()
depends=('gcc')
makedepends=('cmake>=3.2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/crapp/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('d1cfd63b5ab9de8b3f5124ab23d61c6f')
validpgpkeys=()

prepare() {
  ls -al
	cd "$pkgname-$pkgver"
  mkdir build
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DUNIT_TEST=ON -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ../
	make
}

check() {
	cd "$pkgname-$pkgver/build"
  src/test/geomandel_tests
}

package() {
	cd "$pkgname-$pkgver/build"
	make install
}
