# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=libbrotli
pkgver=1.0
pkgrel=1
pkgdesc="meta project to build libraries from the brotli source code"
arch=('x86_64' 'i686')
url="https://github.com/bagder/libbrotli"
license=('MIT')
makedepends=('git')
depends=('brotli')
provides=('libbrotli')
source=("$pkgname"::'git+https://github.com/bagder/libbrotli.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname}"
	git checkout tags/libbrotli-$pkgver
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
