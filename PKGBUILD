# Maintainer: Christian <0x2a@posteo.org>
pkgname=ealogger
pkgver=0.7.1
pkgrel=1
epoch=
pkgdesc="ealogger is an easy to use asynchronous logger library for C++"
arch=('i686' 'x86_64')
url="https://github.com/crapp/ealogger"
license=('Apache-2.0')
groups=()
depends=('gcc')
makedepends=('cmake')
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
md5sums=('c3989cb05b9ebf11decb54b370a026e3')
validpgpkeys=()

prepare() {
  ls -al
	cd "$pkgname-$pkgver"
  mkdir build
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_UNIT_TEST=ON -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ../
	make
}

check() {
	cd "$pkgname-$pkgver/build"
	src/test/ealogger_test
}

package() {
	cd "$pkgname-$pkgver/build"
	make install
}
