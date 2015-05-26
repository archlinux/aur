# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=fedora-icon-theme
pkgver=1.0.0
_pkgver=1.0.0-16.fc21
pkgrel=3
pkgdesc="Set of icons based from Fedora and RedHat"
arch=("any")
url="http://http://www.redhat.com/"
license=("GPL3")
depends=("mist-icon-theme")
source=("http://rpmfind.net/linux/fedora/linux/development/rawhide/source/SRPMS/f/$pkgname-$_pkgver.src.rpm")

build() {
	cd "$srcdir"
	tar xvjf "$pkgname-$pkgver.tar.bz2"
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
	--bindir=/usr/bin --sbindir=/usr/bin \
	--libexecdir=/usr/lib/$pkgname --libdir=/usr/lib
	make
}

package(){
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir sbindir=/usr/bin
}

md5sums=('19bd3dd378e9cc32c085722419897370')
