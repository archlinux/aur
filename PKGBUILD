# Maintainer: aksr <aksr at t-com dot me>
pkgname=b2pf
pkgver=0.10
pkgrel=1
pkgdesc='A small library of functions for converting ‘base’ characters in Unicode strings into appropriate ‘presentation forms’ for display or printing. '
arch=('i686' 'x86_64')
url='http://quercite.dx.am/'
license=('BSD')
source=("https://github.com/PhilipHazel/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b2702328a689e41c11c65d793b5d1351')
sha1sums=('dcede209918c0570fc835deccbf6a0656fcf84a5')
sha256sums=('ffa1c51f05a602adaa8eb9451dc9ad207ce184dad4c4acc346fa1d0c0591d28a')
sha512sums=('08a163cfa74b8fa727f303bf4a69ff15f27d1252fdd03f75f17feb1c525478ac34d3e9a1920736372e8bb1a325d900b19d08ea680625c5aa8396012e08a3221d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	./RunTest
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	rm $pkgdir/usr/share/doc/$pkgname/{AUTHORS,COPYING,ChangeLog,LICENCE,NEWS}
}
