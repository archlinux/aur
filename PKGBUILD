# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=ctypes-sh
pkgver=0.1
pkgrel=1
pkgdesc="ctypes.sh is a bash plugin that allows you to call routines in shared libraries from within bash"
arch=('i686' 'x86_64')
url="http://ctypes.sh/"
license=('MIT')
depends=('bash' 'libffi')
source=("https://github.com/taviso/ctypes.sh/releases/download/v0.01/ctypes-sh-${pkgver}.tar.gz")
sha256sums=('6e4555c051e0e1408792f41a7f9df63ecbbc5a7c4f6a70580f8d4e64615173a5')

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
