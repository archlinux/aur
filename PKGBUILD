# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=mxk
pkgver=1.10
pkgrel=2
pkgdesc="evdev/uinput input mangling server"
arch=(i686 x86_64)
url="http://welz.org.za/projects/mxk"
license=('GPL')
source=("http://welz.org.za/projects/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4709fe6e02ac9a19931d799fa2b2259aae5c8ed64129eb559e9cdfc3c71dc886')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make prefix="$pkgdir/usr" sbindir='$(prefix)/bin' etcdir="$pkgdir/etc" install
}
