# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=flatbuffers
pkgver=1.7.0
pkgrel=1
pkgdesc="An efficient cross platform serialization library for C++, with support for Java, C# and Go"
arch=('i686' 'x86_64')
url="http://google.github.io/flatbuffers/"
license=('Apache')
depends=()
makedepends=(cmake)
optdepends=('go' 'java-environment' 'mono')
source=(https://github.com/google/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('a7850fc546ece5536b29c61e5115fe6a')


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
