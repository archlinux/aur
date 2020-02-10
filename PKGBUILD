# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=ctypes-sh
pkgver=1.1
pkgrel=1
pkgdesc="ctypes.sh is a bash plugin that allows you to call routines in shared libraries from within bash"
arch=('i686' 'x86_64')
url="http://ctypes.sh/"
license=('MIT')
depends=('bash' 'libffi')
source=("https://github.com/taviso/ctypes.sh/releases/download/v${pkgver}/ctypes-sh-${pkgver}.tar.gz")
sha256sums=('f7c8276b556101c51838296560d152fdcd96b860254a38d216b92986f31f8297')

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
