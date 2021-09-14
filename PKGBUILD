# Maintainer: Christoph Heiss <contact(at)christoph-heiss(dot)at>
# Contributor: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=fitsh
pkgver=0.9.4
pkgrel=1
pkgdesc="a software package for astronomical image processing"
arch=('x86_64' 'i686')
url="https://fitsh.net/"
license=('GPL')
makedepends=('gcc')
source=(https://fitsh.net/download/fitsh/fitsh-$pkgver.tar.gz)
md5sums=('21c8d83d4f09851158b19b0b01cebfe8')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname} --datarootdir=/usr/share
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
