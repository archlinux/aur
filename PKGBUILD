# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=phorward
pkgver=0.24.0
pkgrel=1
epoch=
pkgdesc="C/C++ library and tools for dynamic data structures, regular expressions, etc."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://phorward.info"
license=('BSD')
makedepends=()
checkdepends=()
optdepends=('txt2tags: Documentation generator')
#changelog=CHANGELOG
source=("https://phorward.info/download/phorward/$pkgname-$pkgver.tar.gz")
sha256sums=('a571862d5feb759fee5e6695f8e8553d6d1a1ad3dd28a5f4037e398566c9e5c7')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

