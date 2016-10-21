pkgname=libbde
pkgver=20160731
pkgrel=1
pkgdesc="Library and tools to access the BitLocker Drive Encryption (BDE) encrypted volumes"
url="https://github.com/libyal/libbde"
license=(GPL3)
depends=(openssl)
source=("https://github.com/libyal/libbde/releases/download/$pkgver/libbde-alpha-$pkgver.tar.gz")
sha256sums=('SKIP')
arch=(i686 x86_64)

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --enable-verbose-output --enable-debug-output
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
