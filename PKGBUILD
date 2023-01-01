# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: aksr <aksr at t-com dot me>
_pkgname=cgrep
pkgname=$_pkgname-belllabs
pkgver=8.15
pkgrel=2
pkgdesc='Provides many of the features of grep, egrep, and fgrep with greatly enhanced performance.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/cgrep/'
license=('GPL')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("https://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('7d9f15e9026d075ada9d48bc0c158941')
sha1sums=('89b367fb0f321aac1897e2d9192a49ceb4ebe8fe')
sha256sums=('cd73be8860211cb121656c22400d6007950bdab63e96b9872d4e4dcc11f8202e')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR=$pkgdir install
}
