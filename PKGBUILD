# Maintainer: aksr <aksr at t-com dot me>
pkgname=shellsupport
pkgver=2.3.6
pkgrel=1
pkgdesc='A commandline C program, supports (bourne) shell scripting.'
arch=('i686' 'x86_64')
url='http://www.cons.org/cracauer/shellsupport.html'
license=('unknown')
source=("http://www.cons.org/cracauer/download/$pkgname-$pkgver.tar.gz")
md5sums=('8f24d51c1d16621bca05cf23b7c9b628')
sha1sums=('59d4a35ba65082caac573e2e8b7ed9f6f8a5ae5d')
sha256sums=('922d76bdd06a3ed7241dd6239ca682e4f447a3743cbd6b38a5ef4bef62b5c944')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
