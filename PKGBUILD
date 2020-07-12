# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=ctypes-sh
pkgver=1.2
pkgrel=1
pkgdesc="ctypes.sh is a bash plugin that allows you to call routines in shared libraries from within bash"
arch=('i686' 'x86_64')
url="https://github.com/taviso/ctypes.sh/wiki"
license=('MIT')
depends=('bash' 'libffi')
source=("https://github.com/taviso/ctypes.sh/releases/download/v${pkgver}/ctypes-sh-${pkgver}.tar.gz")
sha256sums=('8896334f5fa88f656057bff807ec6921c8f76fc6de801d996d2057fcb18b3a68')

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
	make DESTDIR="$pkgdir" install
}
