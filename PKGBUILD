# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=dav
pkgver=0.9.0
pkgrel=1
pkgdesc='An ncurses-based console text editor'
arch=('i686' 'x86_64')
url='https://github.com/atsb/dav-text'
license=('GPL2')
depends=('ncurses')
_pkgname=$pkgname-text
source=("https://github.com/atsb/$_pkgname/archive/refs/tags/$_pkgname-$pkgver.tar.gz")
md5sums=('c95aaaa69f8038c4168128b33d329a64')
sha1sums=('8385dfb4c8d35cdf66e639fad322b0e43e1cc8f9')
sha256sums=('deaf954641a16b5a13ae8c36ea09d8710d6a02ed0a8231026c3c20fb5525c7a9')

prepare() {
	cd $srcdir/$_pkgname-$_pkgname-$pkgver
	sed -i 's/install -D dav.1.gz/install -D -m644 dav.1.gz/' Makefile
}

build() {
	cd $srcdir/$_pkgname-$_pkgname-$pkgver
	CFLAGS=-fcommon
	make
}

package() {
	cd $srcdir/$_pkgname-$_pkgname-$pkgver
	make prefix="$pkgdir/usr" install
}
