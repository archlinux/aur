pkgname=libbde
_pkgver=20160731
pkgver=v$_pkgver
pkgrel=1
pkgdesc="Library and tools to access the BitLocker Drive Encryption (BDE) encrypted volumes"
url="https://github.com/libyal/libbde"
license=(GPL3)
depends=(openssl)
source=("https://github.com/libyal/libbde/releases/download/$_pkgver/libbde-alpha-$_pkgver.tar.gz")
sha256sums=('SKIP')
arch=(i686 x86_64)

build() {
	cd $pkgname-$_pkgver
	./configure --prefix=/usr --enable-verbose-output --enable-debug-output
	make
}

package() {
	cd $pkgname-$_pkgver
	make DESTDIR="$pkgdir" install
}
