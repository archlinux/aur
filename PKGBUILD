# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=fitsh
pkgver=0.9.2
pkgrel=1
pkgdesc="a software package for astronomical image processing"
arch=('x86_64' 'i686')
url="https://fitsh.net/"
license=('GPL')
makedepends=('gcc')
source=(https://fitsh.net/download/fitsh/fitsh-$pkgver.tar.gz)
md5sums=('48c7c58f21cd0313fa435e7d6423e10c')
build () {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname} --datarootdir=/usr/share
	make
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
