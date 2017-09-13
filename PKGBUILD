# Maintainer: now-im <now.im.627@gmail.com>

pkgname=fedora-icon-theme
pkgver=1.0.0
_pkgver=1.0.0-21.fc27
pkgrel=4
pkgdesc="Set of icons based from Fedora and RedHat"
arch=("any")
url="http://www.redhat.com/"
license=("GPL3")
depends=("gnome-icon-theme")
makedepends=("intltool")
source=("http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/$pkgname-$_pkgver.src.rpm")
sha256sums=('a0c4b6a8b8c7399cc5bce93e1dc460c6905056e04fa8d59c403c20013595ad7f')

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

