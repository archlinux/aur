# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flxmlrpc
pkgver=1.0.1
pkgrel=3
pkgdesc="XMLRPC for fldigi and other Ham Radio apps"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/downloads/flxmlrpc/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'automake' 'autoconf' 'pkg-config')
source=("$pkgname-$pkgver::git+https://git.code.sf.net/p/fldigi/flxmlrpc#tag=v$pkgver")
#"http://www.w1hkj.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
	cd $pkgname-$pkgver

	autoreconf --install
	./configure --prefix=/usr
}

check() {
	cd "$srcdir"/$pkgname-$pkgver

	make -k check
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('SKIP')
sha256sums=('SKIP')
