# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=flatbuffers
pkgver=1.6.0
pkgrel=1
pkgdesc="An efficient cross platform serialization library for C++, with support for Java, C# and Go"
arch=('i686' 'x86_64')
url="http://google.github.io/flatbuffers/"
license=('Apache')
depends=()
makedepends=(cmake)
optdepends=('go' 'java-environment' 'mono')
source=(https://github.com/google/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('6ae7f9db53072459a9d4be053076a673')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
