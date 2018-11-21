# Maintainer: now-im <now.im.627@gmail.com>

pkgname=fedora-icon-theme
pkgver=1.0.0.24.fc29
_pkgver=1.0.0-24.fc29
pkgrel=1
pkgdesc="Set of icons based from Fedora and RedHat"
arch=("any")
url="http://www.redhat.com/"
license=("GPL3")
depends=("mist-icon-theme")
makedepends=("intltool")
source=("http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/$pkgname-$_pkgver.src.rpm")
sha256sums=('230cbd3eefc86de1141942a45a3ea8dc559bc0f52b25f9e48a6ac21106d0f318')

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

